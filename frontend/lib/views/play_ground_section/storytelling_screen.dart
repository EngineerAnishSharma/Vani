import 'package:flutter_tts/flutter_tts.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/consts/story.dart';
import 'package:frontend/widgets_common/bg_widget.dart';

class StoryListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stories = story;
  final List<Color> cardColors = [
    Colors.lightBlueAccent,
    Colors.lightGreen,
    Colors.orange,
    Colors.purple,
    // Add more colors as needed
  ];

  StoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: "Story List".text.color(fontGrey).make(),
        ),
        body: ListView.builder(
          itemCount: stories.length,
          itemBuilder: (context, index) {
            // Ensure that the color index does not go out of bounds
            final colorIndex = index % cardColors.length;

            return Card(
              elevation: 3.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: cardColors[colorIndex], // Set color based on the index
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  stories[index]['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                ),
                subtitle: Text(
                  'Author: ${stories[index]['author']}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white, // Set text color
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StoryDetailScreen(story: stories[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class StoryDetailScreen extends StatefulWidget {
  final Map<String, dynamic> story;

  const StoryDetailScreen({Key? key, required this.story}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;

  @override
  void dispose() {
    flutterTts.stop(); // Stop the audio when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   widget.story['image'],
            //   height: 200.0,
            //   width: 200.0,
            //   fit: BoxFit.cover,
            // ),
            Text(
              'Author: ${widget.story['author']}',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.story['HindiContent'],
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashRadius: 40,
                    onPressed: () {
                      _speak(widget.story['title'] +
                          widget.story['Hinglish'] +
                          ". Thank you");
                      setState(() {
                        isPlaying = true;
                      });
                    },
                    color: Colors.teal,
                    iconSize: 60,
                    icon: const Icon(Icons.play_circle)),
                IconButton(
                    onPressed: () {
                      flutterTts.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                    color: Colors.red,
                    splashRadius: 40,
                    iconSize: 60,
                    icon: const Icon(Icons.stop_circle)),
                IconButton(
                    onPressed: () {
                      flutterTts.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                    color: Colors.amber.shade700,
                    splashRadius: 40,
                    iconSize: 60,
                    icon: const Icon(Icons.pause_circle)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _speak(String text) async {
    final languages = await flutterTts.getLanguages;
    await flutterTts.setLanguage(languages[23]);
    // final voices = await flutterTts.getVoices;
    // print(voices);
    await flutterTts.setVoice({"name": "hi-in-x-hia-local", "locale": "hi-IN"});

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
    // setState(() {});
  }
}
