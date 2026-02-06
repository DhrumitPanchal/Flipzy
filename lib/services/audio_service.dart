import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _bgPlayer = AudioPlayer();
  static final AudioPlayer _sfxPlayer = AudioPlayer();

  static bool musicEnabled = true;
  static bool sfxEnabled = true;

  // 🎵 BACKGROUND MUSIC

  static Future<void> playBackground() async {
    if (!musicEnabled) return;

    await _bgPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgPlayer.play(AssetSource('sounds/music.mp3'));
  }

  static Future<void> stopBackground() async {
    await _bgPlayer.stop();
  }

  static Future<void> pauseBackground() async {
    await _bgPlayer.pause();
  }

  static Future<void> resumeBackground() async {
    if (!musicEnabled) return;
    await _bgPlayer.resume();
  }

  static Future<void> toggleMusic() async {
    musicEnabled = !musicEnabled;

    if (musicEnabled) {
      await playBackground();
    } else {
      await stopBackground();
    }
  }

  // 🔊 SOUND EFFECTS

  static Future<void> playFlip() async {
    if (!sfxEnabled) return;
    await _sfxPlayer.play(AssetSource('sounds/swipe.mp3'));
  }

  static Future<void> buttonTap() async {
    if (!sfxEnabled) return;
    await _sfxPlayer.play(AssetSource('sounds/Button-Tap.wav'));
  }

  static void toggleSfx() {
    sfxEnabled = !sfxEnabled;
  }
}
