import 'package:flutter/services.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/consts/data/swar_data.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/practice_voice.dart';
import 'package:frontend/views/virtual_assitant/virtual_assistant_widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Swar extends StatelessWidget {
  late List<MapEntry<String, List<Object>>> swarData;

  Swar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Loc.get["letters_swar"].text.color(fontGrey).make(),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: swarArr.length,
        itemBuilder: (context, index) {
          swarData = swarArr[index].entries.toList();
          final devanagari = swarData[0].key;
          final value = swarData[0].value;
          final transliteration = value[0] as String;
          final lipsIndices = value[1] as List<int>;
          final tongueIndices = value[2] as List<int>;
          return Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      devanagari,
                      style: const TextStyle(
                        fontSize: 46,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transliteration,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])).onTap(() async {
            HapticFeedback.heavyImpact();
            await TextToSpeech.speakText(devanagari);
          }).onDoubleTap(() {
            HapticFeedback.heavyImpact();
            Get.to(() => PracticeScreen(
                lipsIndices: lipsIndices,
                tongueIndices: tongueIndices,
                devnagri: devanagari));
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
              double desiredHeight = screenHeight * 0.8;

              return Container(
                height: desiredHeight,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const VirtualAssistantWidget(
                  text: [
                    'Tap once to hear pronounciation and twice to practice the word in detail.'
                  ],
                  imagePaths: [
                    'assets/images/swarscreenAssistant/swarAssistant.png'
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
