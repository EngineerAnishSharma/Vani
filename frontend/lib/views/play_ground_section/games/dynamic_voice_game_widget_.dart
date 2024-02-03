import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/speech_to_text_tts/speech_to_text_widget.dart';
import 'package:frontend/views/virtual_assitant/right_wrong_widget.dart';
import 'package:frontend/widgets_common/bg_widget.dart';


class GamesListScreen extends StatelessWidget {
  const GamesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: 'Game List'.text.color(fontGrey).make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameCard(
                  game: createTrafficLightGame(),
                  onPressed: () {
                    navigateToGame(context, createTrafficLightGame());
                  },
                ),
                const SizedBox(height: 16.0),
                GameCard(
                  game: createColorGame(),
                  onPressed: () {
                    navigateToGame(context, createColorGame());
                  },
                ),
                const SizedBox(height: 16.0),
                GameCard(
                  game: createShapeGame(),
                  onPressed: () {
                    navigateToGame(context, createShapeGame());
                  },
                ),
                const SizedBox(height: 16.0),
                GameCard(
                  game: createCartoonGame(),
                  onPressed: () {
                    navigateToGame(context, createCartoonGame());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToGame(BuildContext context, DynamicVoiceGame game) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DynamicVoiceScreen(game),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final DynamicVoiceGame game;
  final VoidCallback onPressed;

  const GameCard({
    super.key,
    required this.game,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/${game.folderName}/${game.imageToWordMap.keys.first}.${game.extension}',
              fit: BoxFit.cover,
              height: 120.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.gameName,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    game.instructions,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicVoiceScreen extends StatelessWidget {
  final DynamicVoiceGame game;

  const DynamicVoiceScreen(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: game,
    );
  }
}

class DynamicVoiceGame extends StatefulWidget {
  final String gameName;
  final String folderName;
  final Map<String, List<String>> imageToWordMap;
  final String instructions;
  final String extension;
  final Function? onComplete;
  final bool strictMode;

  const DynamicVoiceGame(
      {super.key,
      required this.gameName,
      required this.folderName,
      required this.imageToWordMap,
      required this.instructions,
      required this.extension,
      this.onComplete,
      required this.strictMode});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicVoiceGameState createState() => _DynamicVoiceGameState();
}

class _DynamicVoiceGameState extends State<DynamicVoiceGame> {
  String currentImage = "default";
  String folderName = "default";
  int currentIndex = 0;

  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentImage = currentImage == "default"
        ? widget.imageToWordMap.keys.first.toString()
        : currentImage;
    folderName = folderName == "default" ? widget.folderName : folderName;
    String extension = widget.extension;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: widget.gameName.text.color(fontGrey).make(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/$folderName/$currentImage.$extension',
              width: double.infinity, // Make the image take full width
              height: double.infinity, // You can adjust the height if needed
              fit: BoxFit.contain, // Cover the entire available space
              key: Key(currentImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0), // Add bottom padding
            child: Column(
              children: [
                Text(
                  widget.instructions,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SpeechToTextWidget(
                  onTextSpoken: (spokenText) {
                    handleSpokenText(spokenText);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              numberOfParticles: 20,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: -pi / 2,
              minBlastForce: 20,
              maxBlastForce: 25,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              createParticlePath: drawStar,
            ),
          ),
        ],
      ),
    );
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  void handleSpokenText(String spokenText) {
    // Convert spoken text to lowercase for case-insensitive comparison
    spokenText = spokenText.toLowerCase();

    if (widget.strictMode) {
      List<String> values = widget.imageToWordMap.valuesList()[currentIndex];
      bool isMatch = false;

      for (String word in values) {
        if (spokenText.contains(word)) {
          raisePopup(context, true);
          // Success
          isMatch = true;
          currentIndex++;
          _confettiController.play();
          if (currentIndex == widget.imageToWordMap.length) {
            widget.onComplete!();
          }
          setState(() {
            currentImage = widget.imageToWordMap.keysList()[currentIndex];
          });

          break; // Exit the loop once a match is found
        }
      }

      if (!isMatch) {
        raisePopup(context, false);
      }
    } else {
      for (var i = 0; i < widget.imageToWordMap.length; i++) {
        for (var j = 0; j < widget.imageToWordMap.valuesList()[i].length; j++) {
          String word = widget.imageToWordMap.valuesList()[i][j];
          if (spokenText.contains(word)) {
            raisePopup(context, true);
            setState(() {
              currentImage = widget.imageToWordMap.keysList()[i];
            });
            print("Task completed. Playing confetti.");
            _confettiController.play();
            return; // Exit the method once a match is found
          }
        }
      }

      // If no match is found, raise a failure popup
      raisePopup(context, false);
    }
  }
}

DynamicVoiceGame createTrafficLightGame() {
  return const DynamicVoiceGame(
    gameName: "Traffic Lights",
    folderName: "traffic",
    imageToWordMap: {
      "red": ["stop"],
      "yellow": ["slow", "wait"],
      "green": ["go"]
    },
    instructions: "Say Go, Stop or Slow",
    extension: "png",
    strictMode: false,
  );
}

DynamicVoiceGame createNumberGame() {
  return DynamicVoiceGame(
    gameName: "Counting Numbers",
    folderName: "numbers",
    imageToWordMap: const {
      "0": ["zero"],
      "1": ["one", "first"],
      "2": ["two", "second"],
      "3": ["three", "third"],
      "4": ["four", "fourth"],
      "5": ["five", "fifth"],
      "6": ["six", "sixth"],
      "7": ["seven", "seventh"],
      "8": ["eight", "eighth"],
      "9": ["nine", "nineth"]
    },
    instructions: "Say the number shown in the picture.",
    extension: "png",
    strictMode: true,
    onComplete: () {
      print("Complete");
    },
  );
}

DynamicVoiceGame createShapeGame() {
  return DynamicVoiceGame(
    gameName: "Friendly Shapes",
    folderName: "shapes",
    imageToWordMap: const {
      "circle": ["circle"],
      "square": ["rectangle", "square"],
      "star": ["star"],
      "heart": ["heart"],
      "triangle": ["triangle"]
    },
    instructions: "Say the shapes shown in the picture.",
    extension: "png",
    strictMode: true,
    onComplete: () {
      print("Complete");
    },
  );
}

DynamicVoiceGame createCartoonGame() {
  return DynamicVoiceGame(
    gameName: "Cartoon Mania",
    folderName: "cartoons",
    imageToWordMap: const {
      "bheem": ["chhota", "bheem", "chota", "bhem"],
      "ben": ["ben", "ten", "ben 10"],
      "hattori": ["ninja", "hattori"],
      "ppg": ["power", "puff", "girls", "powerpuff"],
      "tnj": ["jerry", "tom"],
      "doraemon": ["doraemon"],
      "mm": ["mickey", "mouse"]
    },
    instructions: "Say the name of cartoons shown in the picture.",
    extension: "jpg",
    strictMode: true,
    onComplete: () {
      print("Complete");
    },
  );
}

DynamicVoiceGame createColorGame() {
  return DynamicVoiceGame(
    gameName: "Colours Everywhere",
    folderName: "colours",
    imageToWordMap: const {
      "black": ["black"],
      "blue": ["blue"],
      "brown": ["brown"],
      "green": ["green"],
      "orange": ["orange"],
      "pink": ["pink"],
      "purple": ["purple"],
      "red": ["red"],
      "white": ["white"],
      "yellow": ["yellow"]
    },
    instructions: "Say the color shown in the picture.",
    extension: "jpg",
    strictMode: true,
    onComplete: () {
      print("Complete");
    },
  );
}

DynamicVoiceGame createEndlessColorGame() {
  return const DynamicVoiceGame(
      gameName: "Colours Everywhere",
      folderName: "colours",
      imageToWordMap: {
        "black": ["green"],
        "blue": ["red"],
        "brown": ["pink"],
        "green": ["orange"],
        "orange": ["purple"],
        "pink": ["white"],
        "purple": ["brown"],
        "red": ["black"],
        "white": ["yellow"],
        "yellow": ["blue"]
      },
      instructions: "Say the color shown in the picture.",
      extension: "jpg",
      strictMode: false);
}

void raisePopup(BuildContext context, bool isSuccess) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double desiredHeight = screenHeight * 0.17;
      double screenWidth = MediaQuery.of(context)
          .size
          .width; // Corrected from size.height to size.width
      double desiredWidth = screenWidth;

      return Container(
        height: desiredHeight,
        width: desiredWidth,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: RightWrongWidget(
          isCorrect: isSuccess,
        ),
      );
    },
  );
}
