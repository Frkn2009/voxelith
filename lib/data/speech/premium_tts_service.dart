import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/features.dart';
import '../../core/supabase_config.dart';

/// ElevenLabs destekli "gerçek insan sesine yakın" anlatım (Plus özelliği).
/// Gerçek bir anadil konuşan kaydı DEĞİL — sentetik ama çok daha doğal bir
/// ses. Sunucu tarafında ELEVENLABS_API_KEY yoksa veya kullanıcı Plus
/// değilse [speak] sessizce false döner; çağıran taraf bu durumda cihazın
/// kendi TTS'ine (SpeechController) düşmelidir.
class PremiumTtsService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<bool> speak(
    String text, {
    String? voiceId,
    String? lang,
  }) async {
    // Ücretli ses kapalı: çağıran taraf cihaz TTS'ine düşer.
    if (!Features.paidCloudApis || !SupaConfig.isSet) return false;
    final client = Supabase.instance.client;
    if (client.auth.currentSession == null) return false;

    try {
      final response = await client.functions.invoke(
        'tts',
        body: {'text': text, 'voiceId': ?voiceId, 'lang': ?lang},
      );
      final data = response.data;
      if (data is! Map || data['audioBase64'] is! String) return false;
      final bytes = base64Decode(data['audioBase64'] as String);
      await _player.stop();
      await _player.play(BytesSource(bytes));
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Oynatmanın bitmesini bekler (sıralı okuma için). Zaman aşımı, takılı
  /// kalmayı önler.
  static Future<void> waitUntilDone() async {
    try {
      await _player.onPlayerComplete.first.timeout(const Duration(seconds: 20));
    } catch (_) {}
  }

  static Future<void> stop() => _player.stop();
}
