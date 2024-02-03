import 'package:flutter_svg/svg.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/AudioApi.dart';
import 'package:frontend/utils/audio_player.dart';
import 'package:frontend/utils/audio_record.dart';
import 'package:frontend/utils/camera_util.dart';
import 'package:frontend/utils/speech_to_text.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/lip_sync_widget.dart';
import 'package:frontend/views/virtual_assitant/virtual_assistant_widget.dart';
import 'package:frontend/widgets_common/bg_widget.dart';

import '../../consts/tts_speed.dart';
import 'package:frontend/views/learning_screen/tongue_sync_widget.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen(
      {Key? key,
      required this.lipsIndices,
      required this.tongueIndices,
      required this.devnagri,
      this.pronunciation})
      : super(key: key);

  final String? pronunciation;
  final String devnagri;
  final List<int> lipsIndices;
  final List<int> tongueIndices;

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  double animationSpeed = NormalSpeechSpeed;
  bool isSpeaking = false;
  bool cameraStatus = false;
  bool goSlow = false;
  bool isPlayingAudio = false;
  bool showLips = true;
  String result = "";
  List aspirated = [
    "ख",
    "घ",
    "छ",
    "झ",
    "ठ",
    "ढ",
    "थ",
    "ध",
    "फ",
    "भ",
    "ह",
  ];
  List voiced = [
    "ग",
    "घ",
    "ज",
    "झ",
    "ड",
    "ढ",
    "द",
    "ध",
    "ब",
    "भ",
    "ल",
    "व",
    "ह",
  ];
  @override
  Widget build(BuildContext context) {
    print(widget.pronunciation);
    return bgWidget(SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          isSpeaking
              ? SizedBox(
                  width: 350,
                  height: 500,
                  child: cameraStatus
                      ? CameraUtils.viewCamera()
                      : const SizedBox(
                          height: 350,
                          width: 350,
                        ),
                )
              : Column(
                  children: [
                    showLips
                        ? Container(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 380,
                              child: LipSyncWidget(
                                key: lipSyncWidgetKey,
                                imageIndices: [0] + widget.lipsIndices + [0],
                                totalDuration: calculateSpeechDuration(
                                    widget.devnagri, false),
                                devnagri: widget.devnagri,
                                animationSpeed: animationSpeed,
                              ),
                            ),
                          ).onTap(() async {
                            await TextToSpeech.speakText(
                              widget.devnagri,
                              rate:
                                  goSlow ? SlowSpeechSpeed : NormalSpeechSpeed,
                            );
                            lipSyncWidgetKey.currentState?.replayAnimation();
                            tongueSyncWidgetKey.currentState?.replayAnimation();
                          })
                        : GestureDetector(
                            onTap: () async {
                              await TextToSpeech.speakText(
                                widget.devnagri,
                                rate: goSlow
                                    ? SlowSpeechSpeed
                                    : NormalSpeechSpeed,
                              );
                              lipSyncWidgetKey.currentState?.replayAnimation();
                              tongueSyncWidgetKey.currentState
                                  ?.replayAnimation();
                            },
                            child: SizedBox(
                              height: 365,
                              child: TongueSyncWidget(
                                  key: tongueSyncWidgetKey,
                                  imageIndices:
                                      [0] + widget.tongueIndices + [0],
                                  totalDuration: calculateSpeechDuration(
                                      widget.devnagri, goSlow),
                                  devnagri: widget.devnagri,
                                  animationSpeed: animationSpeed),
                            ),
                          ),
                    widget.pronunciation.isEmptyOrNull
                        ? "".text.make()
                        : "${widget.pronunciation}".text.make(),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xff1db4fb),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: 322,
                        height: 60,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.devnagri,
                                  style: const TextStyle(
                                      fontSize: 36, color: Color(0xff1db4fb)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await TextToSpeech.speakText(
                                    widget.devnagri,
                                    rate: goSlow
                                        ? SlowSpeechSpeed
                                        : NormalSpeechSpeed,
                                  );
                                  lipSyncWidgetKey.currentState
                                      ?.replayAnimation();
                                  tongueSyncWidgetKey.currentState
                                      ?.replayAnimation();
                                },
                                child: Image.asset(speaker),
                              ),
                              Row(
                                children: [
                                  Switch(
                                    value: goSlow,
                                    activeColor: const Color(0xff1db4fb),
                                    onChanged: (value) {
                                      setState(() {
                                        goSlow = value;
                                        updateAnimationSpeed(goSlow);
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Go Slow',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xffc0c0c0)),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showLips = true;
                                  });
                                },
                                child: Image.asset(
                                    "assets/images/lips_upscaled/0.png"),
                              ),
                              SizedBox(
                                width: 40,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showLips = !showLips;
                                      });
                                    },
                                    child: Image.asset(
                                        "assets/images/tongue/0.png")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            voiced.contains(widget.devnagri)
                                ? SvgPicture.asset(
                                    'assets/images/voicedSvg/voiced.svg', // Replace with the path to your first SVG image
                                    height: 100, // Adjust the height as needed
                                    // width: 100, // Adjust the width as needed
                                  )
                                : Container(),
                            aspirated.contains(widget.devnagri)
                                ? Image.asset(
                                    'assets/images/voicedSvg/aspirated.png',
                                    height: 105,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          isSpeaking
              ? Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/listen.gif'),
                )
              : Container(),
          Visibility(
            visible: isPlayingAudio,
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset('assets/speak.gif'),
            ),
          ),
          const Spacer(),
          !isPlayingAudio
              ? Expanded(
                  child: Center(
                    child: Container(
                      width: 220,
                      height: 64,
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        color: const Color(0xffe8e8e8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                        onTapDown: (details) async {
                          await RecordUtils.record();
                          String text = await SpeechToText.listenText();
                          print(text);
                          cameraStatus = await CameraUtils.startCamera();
                          setState(() {
                            isSpeaking = true;
                          });
                        },
                        onTapUp: (details) async {
                          setState(() {
                            isSpeaking = false;
                          });
                          await CameraUtils.stopCamera();
                          await RecordUtils.stop();
                          SpeechToText().speech.stop();
                          await AudioPlayerUtils
                              .playAudioFromCacheWithCallbacks(
                            onStart: () {
                              setState(() {
                                isPlayingAudio = true;
                              });
                            },
                            onEnd: () {
                              setState(() {
                                isPlayingAudio = false;
                              });
                            },
                          );
                          final temp =
                              await RecordUtils.saveRecordingToDownloads(
                                  '/data/user/0/com.example.fronted/cache/audio',
                                  widget.devnagri);

                          int lastSlashIndex = temp!.lastIndexOf('/');
                          // String secondPart =
                          temp.substring(lastSlashIndex + 1);
                          // int underscoreIndex = secondPart.indexOf('_');
                          // String firstPart =
                          //     secondPart.substring(0, underscoreIndex);
                          // if (temp.isNotEmpty) {
                          //   result =
                          //       (await AudioApi.uploadFiles(firstPart, temp))
                          //           as String;

                          //   VxToast.show(context, msg: result);
                          // }
                        },
                        child: Container(
                          width: 250,
                          height: 60,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSpeaking
                                ? const Color(0xff1db4fb)
                                : Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                mic2,
                                color: isSpeaking
                                    ? Colors.white
                                    : const Color(0xff1db4fb),
                                width: 23,
                                height: 30,
                              ),
                              Text(
                                "Hold To Speak",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: isSpeaking
                                      ? Colors.white
                                      : const Color(0xff1db4fb),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ]),
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
                      'Mic plays the sound with sync to animation and go slow button reduces speed of both.',
                      'Toggle to top view animation',
                      'Toggle to rear view animation',
                      'User can test himself by pronouncing',
                      'Aspiration refers to a burst of air that accompanies the release of certain consonant sounds.Voiced sounds are those where the vocal cords vibrate while producing the sound, creating a buzz or vibration in the throat'
                    ],
                    imagePaths: [
                      'assets/images/practiceAssistant/PracticeAssistant1.png',
                      'assets/images/practiceAssistant/PracticeAssistant2.png',
                      'assets/images/practiceAssistant/PracticeAssistant3.png',
                      'assets/images/practiceAssistant/PracticeAssistant4.png',
                      'assets/images/practiceAssistant/PracticeAssistant5.png',
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
    ));
  }

  Duration calculateSpeechDuration(String text, bool goslow) {
    double letterDuration = goslow ? SlowSpeechSpeed : NormalSpeechSpeed;
    // if (text.length <= 2) {
    //   print("HELLOO");
    //   return const Duration(milliseconds: 100);
    // }

    int totalLetters = text.length;
    int durationInMilliseconds = (totalLetters * letterDuration * 1000).ceil();

    return Duration(milliseconds: durationInMilliseconds);
  }

  void updateAnimationSpeed(bool goSlow) {
    setState(() {
      animationSpeed = goSlow ? SlowSpeechSpeed : NormalSpeechSpeed;
      lipSyncWidgetKey.currentState?.updateAnimationSpeed(goSlow);
      tongueSyncWidgetKey.currentState?.updateAnimationSpeed(goSlow);
    });
  }
}
