// import 'package:frontend/consts/consts.dart';
// import 'package:frontend/utils/text_to_speech.dart';
// import 'package:frontend/views/learning_screen/lip_sync_widget.dart';
// import 'package:frontend/views/learning_screen/sound_listen_screen.dart';
// import 'package:get/get.dart';

// import '../../utils/mcq_utils.dart';

// class SwarScreen extends StatefulWidget {
//   const SwarScreen({
//     Key? key,
//     required this.animationIndices,
//     required this.devnagri,
//   }) : super(key: key);

//   final String devnagri;
//   final List<int> animationIndices;

//   @override
//   State<SwarScreen> createState() => _SwarScreenState();
// }

// class _SwarScreenState extends State<SwarScreen> {
//   double animationSpeed = 0.5; // Initial animation speed
//   bool isSpeaking = false;
//   bool goSlow = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(
//           child: Column(
//             children: [
//               15.heightBox,
//               Container(
//                 width: 332,
//                 height: 209,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(9.379084587097168),
//                   color: Colors.white,
//                 ),
//                 child: Stack(
//                   alignment: Alignment.topRight,
//                   children: [
//                     Center(
//                       child: Text(
//                         widget.devnagri,
//                         style: const TextStyle(fontSize: 100),
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.clip, // Clip overflowing text
//                       ),
//                     ),
//                     Positioned(
//                       top: 8,
//                       right: 10,
//                       child: GestureDetector(
//                         onTap: () async {
//                           await TextToSpeech.speakText(
//                             widget.devnagri,
//                             rate: goSlow ? 0.1 : 0.5,
//                           );
//                           lipSyncWidgetKey.currentState?.replayAnimation();
//                         },
//                         child: Image.asset(volume),
//                       ),
//                     ),
//                   ],
//                 ),
//               ).box.rounded.clip(Clip.antiAlias).shadowSm.makeCentered(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   height: 200,
//                   child: LipSyncWidget(
//                     key: lipSyncWidgetKey,
//                     imageIndices: [0] + widget.animationIndices + [0],
//                     totalDuration:
//                         calculateSpeechDuration(widget.devnagri, false),
//                     devnagri: widget.devnagri,
//                     animationSpeed: animationSpeed,
//                   ),
//                 ),
//               ),
//               Container(
//                   width: 320,
//                   height: 127,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(11),
//                       color: Colors.white),
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25),
//                     child: Center(
//                       child: Text(
//                           "The tongue is in a neutral position at the bottom of the mouth, not touching any part of the mouth's roof. ",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w300,
//                           )),
//                     ),
//                   )).box.rounded.shadowXl.clip(Clip.antiAlias).make(),
//               const Spacer(),
//               InkWell(
//                   onTap: () {
//                     Get.to(() => SoundListenScreen(
//                           animationIndices: widget.animationIndices,
//                           devnagri: widget.devnagri,
//                           correctAns: getEnglishSound(widget.devnagri),
//                           englishSounds:
//                               getRandomEnglishSounds(widget.devnagri),
//                         ));
//                   },
//                   child: Container(
//                     height: 43,
//                     width: 293,
//                     // ignore: sort_child_properties_last
//                     child: Row(
//                       children: [
//                         const SizedBox(
//                           width: 100,
//                         ),
//                         const Text(
//                           'Continue O',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16),
//                         ),
//                         const SizedBox(
//                           width: 60,
//                         ),
//                         Image.asset(paw),
//                       ],
//                     ),
//                     decoration: BoxDecoration(
//                         color: const Color(0xFF5538EE),
//                         borderRadius: BorderRadius.circular(30)),
//                   )),
//               const SizedBox(
//                 height: 20,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Duration calculateSpeechDuration(String text, bool goslow) {
//     double letterDuration = goslow ? 0.05 : 0.1;
//     if (text.length == 1) {
//       return const Duration(milliseconds: 1000);
//     }

//     int totalLetters = text.length;
//     int durationInMilliseconds = (totalLetters * letterDuration * 1000).ceil();
//     print(durationInMilliseconds);

//     return Duration(milliseconds: durationInMilliseconds);
//   }

//   void updateAnimationSpeed(bool goSlow) {
//     setState(() {
//       animationSpeed = goSlow ? 0.3 : 0.5;
//       lipSyncWidgetKey.currentState?.updateAnimationSpeed(goSlow);
//     });
//   }
// }
