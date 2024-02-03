import 'package:frontend/consts/consts.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/play_ground_section/games/dynamic_voice_game_widget_.dart';
import 'package:frontend/views/play_ground_section/storytelling_screen.dart';
import 'package:frontend/views/play_ground_section/video_screen/video_list_screen.dart';
import 'package:get/get.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key});

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Fun and learn play ground'.text.color(fontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionContainer(
              title: 'Game Section',
              color: Colors.blue,
            ).onTap(() {
              TextToSpeech.speakText("Game Section");
            }).onDoubleTap(() {
              Get.to(() => const GamesListScreen());
            }),
            const SizedBox(height: 16),
            const SectionContainer(
              title: 'Video Section',
              color: Colors.orange,
            ).onTap(() {
              TextToSpeech.speakText("Video Section");
            }).onDoubleTap(() {
              Get.to(() => const VideoListScreen());
            }),
            const SizedBox(height: 16),
            const SectionContainer(
              title: "Story Listening",
              color: Colors.green,
            ).onTap(() {
              TextToSpeech.speakText("Story Listening");
            }).onDoubleTap(() {
              Get.to(() => StoryListScreen());
            }),
            // const SizedBox(height: 16),
            // const SectionContainer(
            //   title: 'Learning Section',
            //   color: Colors.pink,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Get.to(() => const VirtualAssistantWidget());
      //   },
      //   backgroundColor: Colors.blue,
      //   child: const Icon(Icons.assistant),
      // ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String title;
  final Color color;

  const SectionContainer({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Content for $title goes here.',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
