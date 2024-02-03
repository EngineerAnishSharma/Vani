import 'package:frontend/consts/consts.dart';
import 'package:frontend/consts/data/bilabial_data.dart';
import 'package:frontend/consts/data/dental_data.dart';
import 'package:frontend/consts/data/palatal_datat.dart';
import 'package:frontend/consts/data/vyanjans_data.dart';
import 'package:frontend/consts/data/retroflex_data.dart';
import 'package:frontend/consts/data/velar_data.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/letter_screen/vyanjans_grid.dart';
import 'package:frontend/views/learning_screen/letter_screen/swar_screen.dart';
import 'package:frontend/views/virtual_assitant/virtual_assistant_widget.dart';
import 'package:frontend/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class LearningContainer extends StatefulWidget {
  final String title;
  final String level;
  final String chapters;
  final VoidCallback onTap;

  const LearningContainer({
    super.key,
    required this.title,
    required this.level,
    required this.chapters,
    required this.onTap,
  });

  @override
  State<LearningContainer> createState() => _LearningContainerState();
}

class _LearningContainerState extends State<LearningContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.level,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Text(
                    widget.chapters,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: redColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ).onTap(widget.onTap),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LetterScreen extends StatelessWidget {
  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidgetSwar(
      Scaffold(
        appBar: AppBar(
          title: Text(Loc.get["Vyanjans"]),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        HapticFeedback.heavyImpact();
                        Get.to(() => Swar());
                      },
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        TextToSpeech.speakText(Loc.get["letters_swar"]);
                      },
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_swar"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onDoubleTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(() => VyanjansGrid(
                          map: velar,
                          barakhadiMap: velarBarakhadi,
                          color: Colors.green,
                          title: "Velar",
                        ));
                  },
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    TextToSpeech.speakText(Loc.get["letters_velar"]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_velar"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(() => VyanjansGrid(
                          map: palatal,
                          barakhadiMap: palatalBarakhadi,
                          color: const Color.fromARGB(255, 225, 58, 254),
                          title: "Palatal",
                        ));
                  },
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    TextToSpeech.speakText(Loc.get["letters_palatal"]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 225, 58, 254),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_palatal"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(() => VyanjansGrid(
                          map: retroflex,
                          barakhadiMap: retroflexBarakhadi,
                          color: Colors.lightBlue,
                          title: "Retroflex",
                        ));
                  },
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    TextToSpeech.speakText(Loc.get["letters_retroflex"]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_retroflex"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(() => VyanjansGrid(
                          map: dental,
                          barakhadiMap: dentalBarakhadi,
                          color: Colors.deepOrange,
                          title: "Dental",
                        ));
                  },
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    TextToSpeech.speakText(Loc.get["letters_dental"]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_dental"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(() => VyanjansGrid(
                          map: bilabial,
                          barakhadiMap: bilabialBarakhadi,
                          color: Colors.teal,
                          title: "Bilabial",
                        ));
                  },
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    TextToSpeech.speakText(Loc.get["letters_bilabial"]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_bilabial"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    HapticFeedback.heavyImpact();
                    Get.to(() => VyanjansGrid(
                          map: vyanjans,
                          barakhadiMap: vyanjansBarakhadi,
                          color: Colors.purple,
                          title: "Vyanjans",
                        ));
                  },
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    TextToSpeech.speakText(Loc.get["letters_vyanjans"]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Loc.get["letters_vyanjans"],
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                      'Practice swars in detail.',
                      'Practice Vyanjans which are divided into different types based on tongue position.'
                    ],
                    imagePaths: [
                      'assets/images/letterscreenAssistant/letterscreenAssisstant1.png',
                      'assets/images/letterscreenAssistant/letterscreenAssisstant2.png',
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.question_mark),
        ),
      ),
    );
  }
}
