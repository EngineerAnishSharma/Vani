import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechApp extends StatefulWidget {
  const TextToSpeechApp({super.key});

  @override
  State<TextToSpeechApp> createState() => TextToSpeechAppState();
}

class TextToSpeechAppState extends State<TextToSpeechApp> {
  TextEditingController textcontroller =
      TextEditingController(text: 'Write some text for speech');

  FlutterTts flutterTts = FlutterTts();
  double volumerange = 0.5;
  double pitchrange = 1;
  double speechrange = 0.5;
  bool isSpeaking = false;
  bool isLoading = false;
  play() async {
    final languages = await flutterTts.getLanguages;
    // print(languages);
    await flutterTts.setLanguage(languages[23]);
    // final voices = await flutterTts.getVoices;
    // print(voices);
    await flutterTts.setVoice({"name": "hi-in-x-hia-local", "locale": "hi-IN"});

    await flutterTts.speak(textcontroller.text);

    isSpeaking = true;
    setState(() {});
  }

  stop() async {
    await flutterTts.stop();
    isSpeaking = false;

    setState(() {});
  }

  pause() async {
    await flutterTts.pause();
    isSpeaking = false;
    setState(() {});
  }

  volume(val) async {
    volumerange = val;
    await flutterTts.setVolume(volumerange);
    setState(() {});
  }

  pitch(val) async {
    pitchrange = val;
    await flutterTts.setPitch(pitchrange);
    setState(() {});
  }

  speech(val) async {
    speechrange = val;
    await flutterTts.setSpeechRate(speechrange);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    flutterTts.setCompletionHandler(() {
      isSpeaking = false;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text(
          'Text To Speech App',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: textcontroller,
                maxLines: null,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Write some text',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AvatarGlow(
                animate: isSpeaking,
                glowColor: const Color.fromARGB(255, 177, 33, 243),
                endRadius: 70,
                child: Material(
                  elevation: 10,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(255, 118, 80, 255),
                    child: Icon(
                      isSpeaking
                          ? Icons.mic_none_outlined
                          : Icons.mic_external_off_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashRadius: 40,
                    onPressed: play,
                    color: Colors.teal,
                    iconSize: 60,
                    icon: const Icon(Icons.play_circle)),
                IconButton(
                    onPressed: stop,
                    color: Colors.red,
                    splashRadius: 40,
                    iconSize: 60,
                    icon: const Icon(Icons.stop_circle)),
                IconButton(
                    onPressed: pause,
                    color: Colors.amber.shade700,
                    splashRadius: 40,
                    iconSize: 60,
                    icon: const Icon(Icons.pause_circle)),
              ],
            ),
            Slider(
              max: 1,
              value: volumerange,
              onChanged: (value) {
                volume(value);
              },
              divisions: 10,
              label: "Volume: $volumerange",
              activeColor: Colors.red,
            ),
            const Text('Set Volume'),
            Slider(
              max: 2,
              value: pitchrange,
              onChanged: (value) {
                pitch(value);
              },
              divisions: 10,
              label: "Pitch Rate: $pitchrange",
              activeColor: Colors.teal,
            ),
            const Text('Set Pitch'),
            Slider(
              max: 1,
              value: speechrange,
              onChanged: (value) {
                speech(value);
              },
              divisions: 10,
              label: "Speech rate: $speechrange",
              activeColor: Colors.amber.shade700,
            ),
            const Text('Set Speech Rate'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
