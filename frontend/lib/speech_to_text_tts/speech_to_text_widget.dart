import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextWidget extends StatefulWidget {
  final Function(String) onTextSpoken;

  const SpeechToTextWidget({Key? key, required this.onTextSpoken})
      : super(key: key);

  @override
  _SpeechToTextWidgetState createState() => _SpeechToTextWidgetState();
}

class _SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  SpeechToText speechToText = SpeechToText();
  bool isListening = false;
  var text = "Hold the button and start speaking";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        AvatarGlow(
          endRadius: 75,
          duration: const Duration(milliseconds: 2000),
          animate: isListening,
          glowColor: Colors.blueAccent,
          repeat: true,
          repeatPauseDuration: const Duration(milliseconds: 100),
          showTwoGlows: true,
          child: GestureDetector(
            onTapDown: (details) async {
              if (!isListening) {
                var available = await speechToText.initialize();
                if (available) {
                  setState(() {
                    isListening = true;
                    speechToText.listen(
                      onResult: (result) {
                        setState(() {
                          text = result.recognizedWords;
                        });
                        if (result.finalResult) {
                          widget
                              .onTextSpoken(text); // Call the callback function
                        }
                      },
                      listenMode: ListenMode.confirmation,
                    );
                  });
                }
              }
            },
            onTapUp: (details) {
              setState(() {
                isListening = false;
              });
              speechToText.stop();
            },
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 35,
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
