import 'package:frontend/consts/consts.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/lip_sync_widget.dart';
import 'package:frontend/views/learning_screen/practice_voice.dart';
import 'package:frontend/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class SoundListenScreen extends StatefulWidget {
  const SoundListenScreen({
    Key? key,
    required this.devnagri,
    required this.correctAns,
    required this.englishSounds,
    required this.lipsIndices,
    required this.tongueIndices,
  }) : super(key: key);

  final List<int> lipsIndices;
  final List<int> tongueIndices;
  final String devnagri;
  final String correctAns;
  final List<String> englishSounds;

  @override
  State<SoundListenScreen> createState() => _SoundListenScreenState();
}

class _SoundListenScreenState extends State<SoundListenScreen> {
  double animationSpeed = 0.5; // Initial animation speed
  bool isSpeaking = false;
  bool goSlow = false;
  String selected = '';
  bool isFirst = false;
  bool isSec = false;
  bool isthird = false;
  bool isFourth = false;
  String correctAnswer = "a";

  bool compare(String correctAns) {
    print(selected);
    print(correctAns);

    if (selected == correctAns) {
      return true;
    } else {
      // Handle the case where the Hindi letter is not found
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> englishSounds = widget.englishSounds;
    print(englishSounds);

    String firstSound = englishSounds[0];
    String secSound = englishSounds[1];
    String thirdSound = englishSounds[2];
    String fourthSound = englishSounds[3];
    return bgWidget(
      Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                10.heightBox,
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.379084587097168),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: Text(
                          widget.devnagri,
                          style: const TextStyle(fontSize: 100),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip, // Clip overflowing text
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {
                            await TextToSpeech.speakText(
                              widget.devnagri,
                              rate: goSlow ? 0.1 : 0.5,
                            );
                          },
                          child: Image.asset(volume),
                        ),
                      ),
                    ],
                  ),
                ).box.rounded.clip(Clip.antiAlias).shadowSm.makeCentered(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("What sound does this make?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Column(children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: isFirst && compare(widget.correctAns)
                          ? Colors.green
                          : isFirst
                              ? redColor
                              : whiteColor,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      firstSound,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ).onTap(() {
                    setState(() {
                      isFirst = true;
                      isSec = false;
                      isthird = false;
                      isFourth = false;
                      selected = firstSound;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: isSec && compare(widget.correctAns)
                          ? Colors.green
                          : isSec
                              ? redColor
                              : whiteColor,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      secSound,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ).onTap(() {
                    setState(() {
                      isFirst = false;
                      isSec = true;
                      isthird = false;
                      isFourth = false;
                      selected = secSound;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: isthird && compare(widget.correctAns)
                          ? Colors.green
                          : isthird
                              ? redColor
                              : whiteColor,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      thirdSound,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ).onTap(() {
                    setState(() {
                      isFirst = false;
                      isSec = false;
                      isthird = true;
                      isFourth = false;
                      selected = thirdSound;
                    });
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: isFourth && compare(widget.correctAns)
                          ? Colors.green
                          : isFourth
                              ? redColor
                              : whiteColor,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      fourthSound,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ).onTap(() {
                    setState(() {
                      isFirst = false;
                      isSec = false;
                      isthird = false;
                      isFourth = true;
                      selected = fourthSound;
                    });
                  }),
                ]),
                20.heightBox,
                const Spacer(),
                InkWell(
                    onTap: () {
                      Get.to(() => PracticeScreen(
                            devnagri: widget.devnagri,
                            lipsIndices: widget.lipsIndices,
                            tongueIndices: widget.tongueIndices,
                          ));
                    },
                    child: Container(
                      height: 43,
                      width: 293,
                      // ignore: sort_child_properties_last
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 100,
                          ),
                          const Text(
                            'Continue O',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Image.asset(paw),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xFF5538EE),
                          borderRadius: BorderRadius.circular(30)),
                    )),
                20.heightBox,
              ],
            )),
      ),
    );
  }

  Duration calculateSpeechDuration(String text, bool goslow) {
    double letterDuration = goslow ? 0.05 : 0.1;
    if (text.length == 1) {
      return const Duration(milliseconds: 1000);
    }

    int totalLetters = text.length;
    int durationInMilliseconds = (totalLetters * letterDuration * 1000).ceil();
    print(durationInMilliseconds);

    return Duration(milliseconds: durationInMilliseconds);
  }

  void updateAnimationSpeed(bool goSlow) {
    setState(() {
      animationSpeed = goSlow ? 0.3 : 0.5;
      lipSyncWidgetKey.currentState?.updateAnimationSpeed(goSlow);
    });
  }
}
