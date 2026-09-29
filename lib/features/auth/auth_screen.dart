import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/events/analytics_events.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// VOXELITH Hesap — e-posta + şifre ile giriş / kayıt.
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _mail = TextEditingController();
  final _pass = TextEditingController();
  bool _busy = false;
  bool _signup = false;
  String? _err;
  String? _info;

  @override
  void dispose() {
    _mail.dispose();
    _pass.dispose();
    super.dispose();
  }

  Future<void> _go() async {
    final mail = _mail.text.trim();
    final pass = _pass.text;
    final i18n = ref.read(i18nProvider);
    if (mail.isEmpty || pass.length < 6) {
      setState(() => _err = i18n.authErrInvalidInput);
      return;
    }
    setState(() {
      _busy = true;
      _err = null;
      _info = null;
    });
    try {
      if (_signup) {
        final hasSession = await Supa.signUp(mail, pass);
        if (!hasSession) {
          setState(() => _info = i18n.authVerifySent);
          return;
        }
        await _afterLogin();
        AnalyticsEvents.log(AnalyticsEvents.signupCompleted);
      } else {
        await Supa.signIn(mail, pass);
        await _afterLogin();
      }
      if (mounted) context.pop();
    } catch (e) {
      final s = e.toString().toLowerCase();
      setState(() {
        if (s.contains('invalid login')) {
          _err = i18n.authErrWrongCredentials;
        } else if (s.contains('already registered') ||
            s.contains('already exists')) {
          _err = i18n.authErrAlreadyRegistered;
        } else if (s.contains('weak password')) {
          _err = i18n.authErrWeakPassword;
        } else {
          _err = i18n.authErrGeneric;
        }
      });
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// Girişten sonra: bulutta profil varsa onu al, yoksa yereli buluta yaz.
  Future<void> _afterLogin() async {
    final sess = ref.read(sessionProvider.notifier);
    final remote = await Supa.pullProfile();
    if (remote != null) {
      await sess.importRemote(remote);
    } else {
      await sess.pushCurrent();
    }
    final family = await Supa.pullFamilyProfiles();
    await sess.importFamilyProfiles(family);
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      backgroundColor: Voxelith.cream,
      appBar: VoxelithAppBar(
        backgroundColor: Voxelith.cream,
        pageTitle: Text(i18n.accountTitle),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
          children: [
            Text(
              i18n.authHeadline,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text(
              i18n.authBody,
              style: const TextStyle(color: Voxelith.muted, height: 1.45),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _mail,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: i18n.emailLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: i18n.passwordLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            if (_err != null) ...[
              const SizedBox(height: 12),
              Text(_err!, style: const TextStyle(color: Voxelith.terr)),
            ],
            if (_info != null) ...[
              const SizedBox(height: 12),
              Text(_info!, style: const TextStyle(color: Voxelith.forest)),
            ],
            const SizedBox(height: 16),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Voxelith.forest,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _busy ? null : _go,
              child: _busy
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Voxelith.cream,
                      ),
                    )
                  : Text(_signup ? i18n.commonSignUp : i18n.commonSignIn),
            ),
            TextButton(
              onPressed: _busy
                  ? null
                  : () => setState(() {
                      _signup = !_signup;
                      _err = null;
                      _info = null;
                    }),
              child: Text(
                _signup ? i18n.haveAccountSignIn : i18n.noAccountSignUp,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              i18n.authPasswordNote,
              style: const TextStyle(
                color: Voxelith.soft,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
