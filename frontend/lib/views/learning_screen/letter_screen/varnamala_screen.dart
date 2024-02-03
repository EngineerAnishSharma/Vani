
// Not useful


// import 'package:frontend/consts/consts.dart';
// import 'package:frontend/utils/text_to_speech.dart';

// class VarnamalaScreen extends StatefulWidget {
//   const VarnamalaScreen({super.key});

//   @override
//   State<VarnamalaScreen> createState() => _VarnamalaScreenState();
// }

// class _VarnamalaScreenState extends State<VarnamalaScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> varnamalaArr = [
//       {'क': 'ka'},
//       {'ख': 'kha'},
//       {'ग': 'ga'},
//       {'घ': 'gha'},
//       {'ङ': 'nga'},
//       {'च': 'cha'},
//       {'छ': 'chha'},
//       {'ज': 'ja'},
//       {'झ': 'jha'},
//       {'ञ': 'nya'},
//       {'ट': 'ṭa'},
//       {'ठ': 'ṭha'},
//       {'ड': 'ḍa'},
//       {'ढ': 'ḍha'},
//       {'ण': 'ṇa'},
//       {'त': 'ta'},
//       {'थ': 'tha'},
//       {'द': 'da'},
//       {'ध': 'dha'},
//       {'न': 'na'},
//       {'प': 'pa'},
//       {'फ': 'pha'},
//       {'ब': 'ba'},
//       {'भ': 'bha'},
//       {'म': 'ma'},
//       {'य': 'ya'},
//       {'र': 'ra'},
//       {'ल': 'la'},
//       {'व': 'va'},
//       {'श': 'śa'},
//       {'ष': 'ṣa'},
//       {'स': 'sa'},
//       {'ह': 'ha'},
//       {'क्ष': 'ksh'},
//       {'त्र': 'tra'},
//       {'ज्ञ': 'gya'},
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: "Velar".text.make(),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(10.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//         ),
//         itemCount: varnamalaArr.length,
//         itemBuilder: (context, index) {
//           final devanagari = varnamalaArr[index].keys.first;
//           final transliteration = varnamalaArr[index].values.first;

//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Text(
//                     devanagari,
//                     style: const TextStyle(fontSize: 24.0),
//                   ),
//                   Text(
//                     transliteration,
//                     style: const TextStyle(fontSize: 16.0),
//                   ),
//                   Container(
//                     width: 60,
//                     height: 2,
//                     decoration: const BoxDecoration(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ).box.rounded.clip(Clip.antiAlias).shadowSm.make().onTap(() async {
//             await TextToSpeech.speakText(devanagari);
//           }).onDoubleTap(() {
//             // Get.to(() => Barakhadi(index: index));
//           });
//         },
//       ),
//     );
//   }
// }
