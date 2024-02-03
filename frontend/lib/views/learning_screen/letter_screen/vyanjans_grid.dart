import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/consts/colors.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/letter_screen/barakhadi_screen.dart';
import 'package:frontend/views/learning_screen/practice_voice.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class VyanjansGrid extends StatefulWidget {
  final Map<String, List<Object>> map;
  final List<Map<String, List<Object>>> barakhadiMap;
  final Color color;
  final String title;
  const VyanjansGrid({
    super.key,
    required this.map,
    required this.barakhadiMap,
    required this.color,
    required this.title,
  });

  @override
  State<VyanjansGrid> createState() => _VyanjansGridState();
}

class _VyanjansGridState extends State<VyanjansGrid> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Loc.get["${widget.title}"].text.color(fontGrey).make(),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: widget.map.length,
                itemBuilder: (context, index) {
                  final devanagari = widget.map.keys.elementAt(index);
                  final List<Object> value = widget.map[devanagari] ?? [];
                  final transliteration = value[0] as String;
                  final lipsIndices = value[1] as List<int>;
                  final tongueIndices = value[2] as List<int>;

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
                  }).onInkLongPress(() {
                    HapticFeedback.heavyImpact();
                    Get.to(() => Barakhadi(
                        barakhadi: widget.barakhadiMap,
                        index: index,
                        color: widget.color,
                        title: widget.title));
                  });
                }),
          ),
        ],
      ),
    ));
  }
}
