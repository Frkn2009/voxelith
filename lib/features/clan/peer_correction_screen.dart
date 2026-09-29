import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/clan.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Peer correction: bir öğrenci klanına bir cümle denemesi gönderir, klan
/// üyeleri düzeltme/yorum bırakır. Busuu'nun en çok övülen özelliğinin
/// klan-kapsamlı, minimal bir sürümü.
class PeerCorrectionScreen extends ConsumerStatefulWidget {
  const PeerCorrectionScreen({super.key});

  @override
  ConsumerState<PeerCorrectionScreen> createState() =>
      _PeerCorrectionScreenState();
}

class _PeerCorrectionScreenState extends ConsumerState<PeerCorrectionScreen> {
  Future<List<PeerSubmission>>? _request;
  final Set<int> _expanded = {};
  final Map<int, Future<List<PeerCorrection>>> _corrections = {};
  bool _submitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (Supa.currentEmail != null) _request = Supa.clanPeerSubmissions();
  }

  void _reload() => setState(() {
    _error = null;
    _corrections.clear();
    _request = Supa.clanPeerSubmissions();
  });

  void _toggle(PeerSubmission submission) {
    setState(() {
      if (_expanded.remove(submission.id)) return;
      _expanded.add(submission.id);
      _corrections.putIfAbsent(
        submission.id,
        () => Supa.peerCorrections(submission.id),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final email = ref.watch(authEmailProvider);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.peerCorrectionTitle)),
      floatingActionButton: email == null
          ? null
          : FloatingActionButton.extended(
              onPressed: _submitting ? null : _openSubmitForm,
              icon: const Icon(Icons.add),
              label: Text(i18n.peerCorrectionSubmitCta),
            ),
      body: SafeArea(
        child: email == null
            ? _login(i18n)
            : FutureBuilder<List<PeerSubmission>>(
                future: _request ??= Supa.clanPeerSubmissions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return _failed(i18n);
                  final submissions = snapshot.data ?? const [];
                  if (submissions.isEmpty) return _empty(i18n);
                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                    itemCount: submissions.length,
                    itemBuilder: (_, index) =>
                        _submissionCard(submissions[index], i18n),
                  );
                },
              ),
      ),
    );
  }

  Widget _login(I18n i18n) => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: VoxelithCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.groups_outlined,
              size: 48,
              color: Voxelith.mintDark,
            ),
            const SizedBox(height: 12),
            Text(
              i18n.clanLoginPrompt,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.push('/auth'),
              child: Text(i18n.clanLoginCta),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _empty(I18n i18n) => ListView(
    padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
    children: [
      const VoxelithMascot(size: 110, mood: MascotMood.wave),
      const SizedBox(height: 16),
      Text(
        i18n.peerCorrectionEmpty,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      if (_error != null) ...[
        const SizedBox(height: 14),
        Text(
          _error!,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Voxelith.coral),
        ),
      ],
    ],
  );

  Widget _failed(I18n i18n) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(i18n.peerCorrectionLoadFailed),
        const SizedBox(height: 10),
        OutlinedButton(onPressed: _reload, child: Text(i18n.retryCta)),
      ],
    ),
  );

  Widget _submissionCard(PeerSubmission submission, I18n i18n) {
    final expanded = _expanded.contains(submission.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: VoxelithCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    i18n.playerDisplayName(submission.playerName),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Voxelith.mintDark,
                    ),
                  ),
                ),
                Text(
                  DateFormat.MMMd().add_Hm().format(submission.createdAt),
                  style: const TextStyle(fontSize: 11, color: Voxelith.muted),
                ),
                if (submission.isMe)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18),
                    tooltip: i18n.peerCorrectionDeleteSubmission,
                    onPressed: () => _deleteSubmission(submission),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              submission.attemptText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            if (submission.note != null && submission.note!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                submission.note!,
                style: const TextStyle(color: Voxelith.muted, fontSize: 13),
              ),
            ],
            const SizedBox(height: 10),
            InkWell(
              onTap: () => _toggle(submission),
              child: Row(
                children: [
                  Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    size: 18,
                    color: Voxelith.mintDark,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    i18n.peerCorrectionCount(submission.correctionCount),
                    style: const TextStyle(
                      color: Voxelith.mintDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (expanded) ...[
              const Divider(height: 20),
              _correctionsSection(submission, i18n),
            ],
          ],
        ),
      ),
    );
  }

  Widget _correctionsSection(PeerSubmission submission, I18n i18n) {
    return FutureBuilder<List<PeerCorrection>>(
      future: _corrections[submission.id],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final corrections = snapshot.data ?? const [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (corrections.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  i18n.peerCorrectionNoCorrectionsYet,
                  style: const TextStyle(color: Voxelith.muted),
                ),
              )
            else
              for (final correction in corrections)
                _correctionTile(submission, correction, i18n),
            const SizedBox(height: 8),
            _CorrectionComposer(
              i18n: i18n,
              onSend: (text) => _addCorrection(submission, text),
            ),
          ],
        );
      },
    );
  }

  Widget _correctionTile(
    PeerSubmission submission,
    PeerCorrection correction,
    I18n i18n,
  ) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                i18n.playerDisplayName(correction.playerName),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(correction.correctionText),
              if (correction.note != null && correction.note!.isNotEmpty)
                Text(
                  correction.note!,
                  style: const TextStyle(color: Voxelith.muted, fontSize: 12),
                ),
            ],
          ),
        ),
        if (correction.isMe)
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 16),
            tooltip: i18n.peerCorrectionDeleteCorrection,
            onPressed: () => _deleteCorrection(submission, correction),
          ),
      ],
    ),
  );

  Future<void> _openSubmitForm() async {
    final i18n = ref.read(i18nProvider);
    final attemptController = TextEditingController();
    final noteController = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(i18n.peerCorrectionSubmitCta),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: attemptController,
              autofocus: true,
              maxLength: 500,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: i18n.peerCorrectionAttemptLabel,
              ),
            ),
            TextField(
              controller: noteController,
              maxLength: 300,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: i18n.peerCorrectionNoteLabel,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(i18n.cancelCta),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(i18n.continueCta),
          ),
        ],
      ),
    );
    if (ok != true || attemptController.text.trim().isEmpty) return;
    setState(() => _submitting = true);
    try {
      final lang = ref.read(sessionProvider).learnLang.name;
      await Supa.submitPeerAttempt(
        attemptText: attemptController.text,
        lang: lang,
        note: noteController.text,
      );
      _reload();
    } catch (_) {
      if (mounted) setState(() => _error = i18n.clanActionFailed);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _addCorrection(PeerSubmission submission, String text) async {
    if (text.trim().isEmpty) return;
    await Supa.addPeerCorrection(
      submissionId: submission.id,
      correctionText: text,
    );
    if (!mounted) return;
    setState(() {
      _corrections[submission.id] = Supa.peerCorrections(submission.id);
      _request = Supa.clanPeerSubmissions();
    });
  }

  Future<void> _deleteSubmission(PeerSubmission submission) async {
    await Supa.deletePeerSubmission(submission.id);
    _reload();
  }

  Future<void> _deleteCorrection(
    PeerSubmission submission,
    PeerCorrection correction,
  ) async {
    await Supa.deletePeerCorrection(correction.id);
    if (!mounted) return;
    setState(() {
      _corrections[submission.id] = Supa.peerCorrections(submission.id);
      _request = Supa.clanPeerSubmissions();
    });
  }
}

class _CorrectionComposer extends StatefulWidget {
  const _CorrectionComposer({required this.i18n, required this.onSend});
  final I18n i18n;
  final Future<void> Function(String text) onSend;

  @override
  State<_CorrectionComposer> createState() => _CorrectionComposerState();
}

class _CorrectionComposerState extends State<_CorrectionComposer> {
  final _controller = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await widget.onSend(text);
      _controller.clear();
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            maxLength: 500,
            decoration: InputDecoration(
              labelText: widget.i18n.peerCorrectionTextLabel,
              counterText: '',
            ),
            onSubmitted: (_) => _send(),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          tooltip: widget.i18n.peerCorrectionAddCta,
          onPressed: _sending ? null : _send,
        ),
      ],
    );
  }
}
