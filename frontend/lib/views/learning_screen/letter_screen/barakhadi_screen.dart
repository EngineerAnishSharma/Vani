
import 'package:flutter/services.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/practice_voice.dart';
import 'package:get/get.dart';

class Barakhadi extends StatefulWidget {
  final int index;
  final Color color;
  final List<Map<String, List<Object>>> barakhadi;
  final String title;
  const Barakhadi({
    super.key,
    required this.index,
    required this.barakhadi,
    required this.color,
    required this.title,
  });

  @override
  State<Barakhadi> createState() => _BarakhadiState();
}

class _BarakhadiState extends State<Barakhadi> {
  late List<MapEntry<String, List<Object>>> barakhadiData;

  @override
  void initState() {
    super.initState();
    barakhadiData = widget.barakhadi[widget.index].entries.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: ("${Loc.get[widget.title]} ${Loc.get["Barakhadi"]}")
            .text
            .color(fontGrey)
            .make(),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: barakhadiData.length,
        itemBuilder: (context, index) {
          final devanagari = barakhadiData[index].key;
          final value = barakhadiData[index].value;
          final transliteration = value[0] as String;
          final lipsIndices = value[1] as List<int>;
          final tongueIndices = value[1] as List<int>;

          return Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      devanagari,
                      style: const TextStyle(
                        fontSize: 46,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transliteration,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])).onTap(() async {
            HapticFeedback.heavyImpact();
            await TextToSpeech.speakText(devanagari);
          }).onDoubleTap(() {
            HapticFeedback.heavyImpact();
            Get.to(() => PracticeScreen(
                lipsIndices: lipsIndices,
                tongueIndices: tongueIndices,
                devnagri: devanagari));
          });
        },
      ),
    );
  }
}
