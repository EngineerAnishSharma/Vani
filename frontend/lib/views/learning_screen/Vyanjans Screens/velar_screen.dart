// import 'package:flutter/material.dart';
// import 'package:frontend/consts/data/velar_data.dart';
// import 'package:frontend/utils/text_to_speech.dart';
// import 'package:frontend/views/learning_screen/idk.dart';
// import 'package:frontend/views/learning_screen/letter_screen/barakhadi_screen.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Velar extends StatefulWidget {
//   const Velar({super.key});

//   @override
//   State<Velar> createState() => _VelarState();
// }

// class _VelarState extends State<Velar> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: "Velar".text.make(),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: GridView.builder(
//                 padding: const EdgeInsets.all(15),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 15,
//                   mainAxisSpacing: 15,
//                 ),
//                 itemCount: velar.length,
//                 itemBuilder: (context, index) {
//                   final devanagari = velar.keys.elementAt(index);
//                   final List<Object> value = velar[devanagari] ?? [];
//                   final transliteration = value[0] as String;
//                   final animationIndices = value[1] as List<int>;

//                   return Card(
//                     elevation: 3.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             devanagari,
//                             style: const TextStyle(
//                               fontSize: 24.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                           Text(
//                             transliteration,
//                             style: const TextStyle(fontSize: 16.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ).onTap(() async {
//                     await TextToSpeech.speakText(devanagari);
//                   }).onDoubleTap(
//                     () {
//                       Get.to(() => SwarScreen(
//                           animationIndices: animationIndices,
//                           devnagri: devanagari));
//                     },
//                   );
//                 },
//               ),
//             ),

//             // const Spacer(),
//             GestureDetector(
//               // onTap: () async {
//               //   Get.to(() => const Barakhadi(index:));
//               // },
//               child: Container(
//                 height: 50,
//                 margin: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Velar Barakhadi",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),

//             10.heightBox,
//           ],
//         ),
//       ),
//     );
//   }
// }
