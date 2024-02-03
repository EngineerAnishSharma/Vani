import 'package:flutter/material.dart';
import 'package:frontend/utils/audio_player.dart';
import 'package:get/get.dart';

class RightWrongWidget extends StatefulWidget {
  final bool isCorrect; // Add a property to determine if the answer is correct

  RightWrongWidget({required this.isCorrect});

  @override
  _RightWrongWidgetState createState() => _RightWrongWidgetState();
}

class _RightWrongWidgetState extends State<RightWrongWidget> {
  // Add a boolean variable to track whether the sound has been played
  bool soundPlayed = false;

  @override
  void initState() {
    // Play sound when the widget is built for the first time
    playSound();
    super.initState();
  }

  // Function to play sound
  void playSound() {
    // TODO: Implement sound playing logic here
    // You can use a package like audioplayers to play audio
    // Example: https://pub.dev/packages/audioplayers
    // Make sure to handle any necessary setup, like loading audio files.
    // Set soundPlayed to true to avoid playing it again.
    soundPlayed = true;
  }

  @override
  Widget build(BuildContext context) {
    // Determine the text and colors based on whether it's correct or incorrect
    String message = widget.isCorrect ? 'Correct' : 'Incorrect';
    Color textColor = Colors.white;
    String correctSound = "success.mp3";
    String wrongSound = "fail.mp3";
    Color backgroundColor = widget.isCorrect ? Colors.green : Colors.red;

    if (widget.isCorrect) {
      AudioPlayerUtils.playAudioFromAssets(correctSound);
    } else {
      AudioPlayerUtils.playAudioFromAssets(wrongSound);
    }

    return SingleChildScrollView(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 32.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0), // Adjust the spacing as needed

            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                primary: textColor, // Set the button color to white or green
              ),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
