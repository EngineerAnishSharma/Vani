// ignore: file_names
import 'package:flutter/services.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/consts/data/abc.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/virtual_assitant/virtual_assistant_widget.dart';

class ABC extends StatefulWidget {
  const ABC({super.key});
  @override
  State<ABC> createState() => _ABCState();
}

class _ABCState extends State<ABC> {
  late Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Loc.get["Alphabets"].text.color(fontGrey).make(),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: abc.length,
        itemBuilder: (context, index) {
          data = abc;
          String s = data.keys.elementAt(index);
          return Container(
              decoration: BoxDecoration(
                color: Colors.pink,
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
                      s,
                      style: const TextStyle(
                        fontSize: 46,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])).onTap(() async {
            HapticFeedback.heavyImpact();
            await TextToSpeech.speakText(s);
          });
        },
      ),
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
                    'Tap once to hear pronounciation and twice to practice the word in detail.'
                  ],
                  imagePaths: [
                    'assets/images/swarscreenAssistant/swarAssistant.png'
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.assistant),
      ),
    );
  }
}
