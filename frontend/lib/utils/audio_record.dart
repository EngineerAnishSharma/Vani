import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class RecordUtils {
  static final recorder = FlutterSoundRecorder();
  static bool isRecorderReady = false;

  static Future initRecorder() async {
    try {
      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw 'Microphone Permission not granted';
      }
      await recorder.openRecorder();
      isRecorderReady = true;
      recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
    } catch (e) {
      print(e);
    }
  }

  static Future record() async {
    try {
      initRecorder();
      if (!isRecorderReady) return;
      await recorder.startRecorder(
        toFile: 'audio',
      );
    } catch (e) {
      print(e);
    }
  }

  static Future stop() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print("Recorded Audio : $audioFile");
  }

  static Future<String?> saveRecordingToDownloads(
      String cacheFilePath, String directory) async {
    try {
      final downloadsDirectory = await getExternalStorageDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      Directory dir = Directory(directory);

      if (!await dir.exists()) {
        try {
          await dir.create(recursive: true);
          print('Directory created successfully');
        } catch (e) {
          print('Error creating directory: $e');
        }
      } else {
        print('Directory does not exist');
      }
      final newFilePath =
          '${downloadsDirectory!.path}/${directory}_$timestamp.mp3';
      await File(cacheFilePath).copy(newFilePath);
      return newFilePath;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
