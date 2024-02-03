// call TTS function using below syntax
// await TextToSpeech.speakText("Hello, Flutter!");

import 'package:flutter_tts/flutter_tts.dart';

import '../consts/tts_speed.dart';

class TextToSpeech {
  late FlutterTts _flutterTts;

  TextToSpeech() {
    _flutterTts = FlutterTts();
  }

  Future<void> speak(String text, {double rate = NormalSpeechSpeed}) async {
    await _flutterTts.setLanguage('hi-IN');
    print(rate);
    _flutterTts.setSpeechRate(rate);
    await _flutterTts.speak(text);
  }

  static Future<void> speakText(String text, {double rate = 0.5}) async {
    print(rate);
    final textToSpeech = TextToSpeech();
    await textToSpeech.speak(text, rate: rate);
  }
}
