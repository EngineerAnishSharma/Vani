import 'package:flutter/material.dart';
import 'package:frontend/utils/score.dart';
import 'package:frontend/speech_to_text_tts/speech_to_text_widget.dart';
import 'package:frontend/widgets_common/bg_widget.dart';

class SpeechChallengeScreen extends StatefulWidget {
  final String correctText;
  final Function() onSuccess;
  final Function() onFail;
  final int maxTries;

  const SpeechChallengeScreen({
    Key? key,
    required this.correctText,
    required this.onSuccess,
    required this.onFail,
    required this.maxTries,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SpeechChallengeScreenState createState() => _SpeechChallengeScreenState();
}

class _SpeechChallengeScreenState extends State<SpeechChallengeScreen> {
  String userText = "";
  int attempts = 0;
  bool showTip = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.correctText,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  if (userText.isNotEmpty && userText != widget.correctText)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            children: Score.generateColoredText(
                                widget.correctText, userText)),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (showTip)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Tips: ${Score.suggestion}'),
            ),
          const SizedBox(height: 20),
          SpeechToTextWidget(
            onTextSpoken: (text) {
              setState(() {
                userText = text;
                // print(userText);
              });

              Score.compareStrings(widget.correctText, userText);

              if (userText == widget.correctText) {
                widget.onSuccess();
              } else {
                attempts++;

                if (attempts >= widget.maxTries) {
                  widget.onFail();
                } else {
                  // Allow another try
                  setState(() {
                    showTip = Score.suggestion.isNotEmpty;
                  });
                }
              }
            },
          ),
        ],
      ),
    ));
  }
}
