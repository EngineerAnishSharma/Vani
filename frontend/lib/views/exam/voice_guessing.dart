import 'package:frontend/consts/consts.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/letter_screen/letter_screen.dart';
import 'package:frontend/views/learning_screen/lip_sync_widget.dart';
import 'package:get/get.dart';

class GuessVoice extends StatefulWidget {
  const GuessVoice({
    Key? key,
    required this.animationIndices,
    required this.devnagri,
  }) : super(key: key);

  final String devnagri;
  final List<int> animationIndices;

  @override
  State<GuessVoice> createState() => _GuessVoiceState();
}

class _GuessVoiceState extends State<GuessVoice> {
  double animationSpeed = 0.5; // Initial animation speed
  bool isSpeaking = false;
  bool goSlow = false;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                width: 332,
                height: 209,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.379084587097168),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    widget.devnagri,
                    style: const TextStyle(fontSize: 80.0),
                  ),
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
              20.heightBox,
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: visible ? Colors.green : Colors.white,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(group),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await TextToSpeech.speakText(
                              widget.devnagri,
                              rate: goSlow ? 0.1 : 0.5,
                            );
                            // lipSyncWidgetKey.currentState?.replayAnimation();
                          },
                          onDoubleTap: () {
                            setState(() {
                              visible = true;
                            });
                          },
                          child: Image.asset(volume),
                        ),
                      ],
                    ),
                  ).onDoubleTap(() {
                    setState(() {
                      visible = true;
                    });
                  }),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: visible ? Colors.red : Colors.white,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(group),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await TextToSpeech.speakText(
                              "Aa",
                              rate: goSlow ? 0.1 : 0.5,
                            );
                            // lipSyncWidgetKey.currentState?.replayAnimation();
                          },
                          child: Image.asset(volume),
                        ),
                      ],
                    ),
                  ).onDoubleTap(() {
                    setState(() {
                      visible = true;
                    });
                  }),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: visible ? Colors.red : Colors.white,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(group),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await TextToSpeech.speakText(
                              "ra",
                              rate: goSlow ? 0.1 : 0.5,
                            );
                            // lipSyncWidgetKey.currentState?.replayAnimation();
                          },
                          child: Image.asset(volume),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: visible ? Colors.red : Colors.white,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(group),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await TextToSpeech.speakText(
                              "pa",
                              rate: goSlow ? 0.1 : 0.5,
                            );
                            // lipSyncWidgetKey.currentState?.replayAnimation();
                          },
                          child: Image.asset(volume),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Get.offAll(() => const LetterScreen());
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
