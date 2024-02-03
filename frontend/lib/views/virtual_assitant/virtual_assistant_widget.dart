import 'package:frontend/consts/consts.dart';
import 'package:frontend/utils/text_to_speech.dart';

class VirtualAssistantWidget extends StatefulWidget {
  final List<String> text;
  final List<String> imagePaths; // Use List<String> for a list of image paths

  const VirtualAssistantWidget({
    Key? key,
    required this.text,
    required this.imagePaths,
  }) : super(key: key);

  @override
  State<VirtualAssistantWidget> createState() => _VirtualAssistantWidgetState();
}

class _VirtualAssistantWidgetState extends State<VirtualAssistantWidget> {
  int currentIndex = 0;

  // void nextImage() {
  //   currentIndex = (currentIndex + 1) % widget.imagePaths.length;
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Help".text.size(20).make(),
            const SizedBox(height: 16.0),
            Image.asset(
              widget.imagePaths[currentIndex],
              height: MediaQuery.of(context).size.height * 0.65,
              // width: MediaQuery.of(context).size.width * 0.9,
              // Set height as needed
              // ).onTap(() async {
              //   await TextToSpeech.speakText(widget.text[currentIndex]);
              // }),
            ),
            20.heightBox,
            ElevatedButton(
                onPressed: () async {
                  await TextToSpeech.speakText(widget.text[(currentIndex + 1)%widget.imagePaths.length]); 
                  currentIndex = (currentIndex + 1) % widget.imagePaths.length;

                  setState(() {});
                },
                child: const Text(
                  'Next',
                ))
          ],
        ),
      ),
    );
  }
}
