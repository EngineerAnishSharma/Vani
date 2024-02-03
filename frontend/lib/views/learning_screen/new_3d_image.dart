import 'package:flip_card/flip_card.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/lip_sync_widget.dart';
import 'package:frontend/views/learning_screen/sound_listen_screen.dart';
import 'package:frontend/views/learning_screen/tongue_sync_widget.dart';
import 'package:frontend/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import '../../utils/mcq_utils.dart';

class ThreeDimensionScreen extends StatefulWidget {
  const ThreeDimensionScreen({
    Key? key,
    required this.lipsIndices,
    required this.tongueIndices,
    required this.devnagri,
  }) : super(key: key);

  final String devnagri;
  final List<int> lipsIndices;
  final List<int> tongueIndices;

  @override
  State<ThreeDimensionScreen> createState() => _ThreeDimensionScreenState();
}

class _ThreeDimensionScreenState extends State<ThreeDimensionScreen> {
  double animationSpeed = 0.5; // Initial animation speed
  bool isSpeaking = false;
  bool goSlow = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                30.heightBox,
                Container(
                  width: 300,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.379084587097168),
                    color: Colors.white,
                  ),
                  child: TongueSyncWidget(
                      key: tongueSyncWidgetKey,
                      imageIndices: [0] + widget.tongueIndices + [0],
                      totalDuration: const Duration(milliseconds: 500),
                      devnagri: widget.devnagri,
                      animationSpeed: animationSpeed),
                ).box.rounded.clip(Clip.antiAlias).shadowSm.makeCentered(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: LipSyncWidget(
                      key: lipSyncWidgetKey,
                      imageIndices: [0] + widget.lipsIndices + [0],
                      totalDuration:
                          calculateSpeechDuration(widget.devnagri, false),
                      devnagri: widget.devnagri,
                      animationSpeed: animationSpeed,
                    ),
                  ),
                ),
                MyFlippableCard(devnagri: widget.devnagri),
                // Container(
                //   width: 100,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(9.379084587097168),
                //     color: Colors.white,
                //   ),
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 10.0, left: 3),
                //           child: Text(
                //             widget.devnagri,
                //             style: const TextStyle(fontSize: 35),
                //           ),
                //         ),
                //         GestureDetector(
                //           onTap: () async {
                //             await TextToSpeech.speakText(
                //               widget.devnagri,
                //               rate: goSlow ? 0.1 : 0.5,
                //             );
                //             lipSyncWidgetKey.currentState?.replayAnimation();
                //           },
                //           child: Image.asset(
                //             volume,
                //             width: 33,
                //           ),
                //         ),
                //       ]),
                // ).box.rounded.clip(Clip.antiAlias).shadowSm.makeCentered(),
                // 10.heightBox,
                // Container(
                //     width: 320,
                //     height: 127,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(11),
                //         color: Colors.white),
                //     child: const Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 25),
                //       child: Center(
                //         child: Text(
                //             "The tongue is in a neutral position at the bottom of the mouth, not touching any part of the mouth's roof. ",
                //             style: TextStyle(
                //               fontSize: 14,
                //               fontWeight: FontWeight.w300,
                //             )),
                //       ),
                //     )).box.rounded.shadowXl.clip(Clip.antiAlias).make(),
                const Spacer(),
                InkWell(
                    onTap: () {
                      Get.to(() => SoundListenScreen(
                            lipsIndices: widget.lipsIndices,
                            tongueIndices: widget.tongueIndices,
                            devnagri: widget.devnagri,
                            correctAns: getEnglishSound(widget.devnagri),
                            englishSounds:
                                getRandomEnglishSounds(widget.devnagri),
                          ));
                      // Get.to(() => PracticeScreen(
                      //     lipsIndices: widget.lipsIndices,
                      //     tongueIndices: widget.tongueIndices,
                      //     devnagri: widget.devnagri));
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
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
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

class MyFlippableCard extends StatefulWidget {
  final String devnagri;

  const MyFlippableCard({Key? key, required this.devnagri}) : super(key: key);

  @override
  _MyFlippableCardState createState() => _MyFlippableCardState();
}

class _MyFlippableCardState extends State<MyFlippableCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: true,
      front: _buildFront(),
      back: _buildBack(),
    );
  }

  Widget _buildBack() {
    return Container(
      width: 320,
      height: 127,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
            "The tongue is in a neutral position at the bottom of the mouth, not touching any part of the mouth's roof. ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ).box.rounded.shadowXl.clip(Clip.antiAlias).make();
  }

  Widget _buildFront() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Set the border color
          width: 2.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 3),
            child: Text(
              widget.devnagri,
              style: const TextStyle(fontSize: 35),
            ),
          ),
          Image.asset(
            volume,
            width: 33,
          ),
        ],
      ),
    ).box.make().onTap(() async {
      await TextToSpeech.speakText(
        widget.devnagri,
        rate: 0.5,
      );
      lipSyncWidgetKey.currentState?.replayAnimation();
      tongueSyncWidgetKey.currentState?.replayAnimation();
      cardKey.currentState?.toggleCard();
    });
  }
}

// Usage example:
// MyFlippableCard(devnagri: "Your Devnagri Text")
