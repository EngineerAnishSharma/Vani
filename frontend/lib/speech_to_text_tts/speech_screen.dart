// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// class SpeechScreen extends StatefulWidget {
//   const SpeechScreen({super.key});

//   @override
//   State<SpeechScreen> createState() => _SpeechScreenState();
// }

// class _SpeechScreenState extends State<SpeechScreen> {
//   SpeechToText speechToText = SpeechToText();

//   var text = "Hold the button and start speaking";
//   bool isListening = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         endRadius: 75,
//         duration: const Duration(milliseconds: 2000),
//         animate: isListening,
//         glowColor: Colors.blueAccent,
//         repeat: true,
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         showTwoGlows: true,
//         child: GestureDetector(
//           onTapDown: (details) async {
//             if (!isListening) {
//               var available = await speechToText.initialize();
//               if (available) {
//                 setState(() {
//                   isListening = true;
//                   speechToText.listen(onResult: (result) {
//                     setState(() {
//                       text = result.recognizedWords;
//                     });
//                   });
//                 });
//               }
//             }
//           },
//           onTapUp: (details) {
//             setState(() {
//               isListening = false;
//             });
//             speechToText.stop();
//           },
//           child: CircleAvatar(
//             backgroundColor: Colors.blueAccent,
//             radius: 35,
//             child: Icon(
//               isListening ? Icons.mic : Icons.mic_none,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         leading: const Icon(
//           Icons.sort_rounded,
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//         elevation: 0.0,
//         title: const Text(
//           'Speech to Text',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         physics: const BouncingScrollPhysics(),
//         child: Container(
//           // color: Colors.red,
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.7,
//           // color: Colors.red,
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           margin: const EdgeInsets.only(bottom: 150),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 20,
//               color: isListening ? Colors.black87 : Colors.black54,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
