import 'package:just_audio/just_audio.dart';

class AudioPlayerUtils {
  static final AudioPlayer audioPlayer = AudioPlayer();

  static Future<void> playAudioFromCache() async {
    String audioPath = '/data/user/0/com.example.fronted/cache/audio';
    try {
      await audioPlayer.setFilePath(audioPath);
      await audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }

  static Future<void> playAudioFromAssets(String filename) async {
    String audioPath = 'asset:/assets/sounds';
    try {
      await audioPlayer.setUrl("$audioPath/$filename");
      await audioPlayer.play();
    } catch (e) {
      print(e);
    }
  }

  static Future<void> playAudioFromCacheWithCallbacks(
      {required Null Function() onStart,
      required Null Function() onEnd}) async {
    String audioPath = '/data/user/0/com.example.fronted/cache/audio';
    try {
      await audioPlayer.setFilePath(audioPath);
      onStart();
      await audioPlayer.play();

      // // Wait for duration and run onEnd
      await audioPlayer.playerStateStream.firstWhere(
          (state) => state.processingState == ProcessingState.completed);

      onEnd();
    } catch (e) {
      print(e);
    }
  }
}
