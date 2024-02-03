// import 'package:frontend/consts/consts.dart';
// import 'package:frontend/consts/data/swar_data.dart';
// import 'package:frontend/utils/text_to_speech.dart';
// import 'package:frontend/views/learning_screen/idk.dart';
// import 'package:get/get.dart';

// class Swar extends StatefulWidget {
//   const Swar({super.key});

//   @override
//   State<Swar> createState() => _SwarState();
// }

// class _SwarState extends State<Swar> {
//   late List<MapEntry<String, List<Object>>> swarData;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: "Swar".text.make(),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(15),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//           childAspectRatio: 2,
//         ),
//         itemCount: swarArr.length,
//         itemBuilder: (context, index) {
//           swarData = swarArr[index].entries.toList();
//           final devanagari = swarData[0].key;
//           final value = swarData[0].value;
//           final transliteration = value[0] as String;
//           final animationIndices = value[1] as List<int>;

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
//             Get.to(() => SwarScreen(
//                 animationIndices: animationIndices, devnagri: devanagari));
//           });
//         },
//       ),
//     );
//   }
// }
