import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _bgPlayer = AudioPlayer();



  static Future<void> playBackground() async {
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
    await _bgPlayer.resume();
  }
}
