import 'package:frontend/consts/consts.dart';
import 'package:frontend/consts/youtube_links.dart';
import 'package:frontend/views/play_ground_section/video_screen/video_player_screen.dart';
import 'package:frontend/widgets_common/bg_widget.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late Map<String, String> currentVideoList;
  late String currentTitle;
  // Color color = Color.fromRGBO(85, 56, 238, 1);
  // Color text = Colors.white;

  @override
  void initState() {
    super.initState();
    // Set the initial values to English videos
    currentVideoList = englishVideo;
    currentTitle = 'English Videos';
  }

  String getThumbnailUrl(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: 'Videos'.text.color(fontGrey).make(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentVideoList = englishVideo;
                        currentTitle = 'English Videos';
                        // color = Colors.black;
                        // text = Colors.white;
                      });
                    },
                    child: const Text('English'),
                  ),
                  10.widthBox,
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentVideoList = hindiVideo;
                        currentTitle = 'हिंदी वीडियो';
                        // color = Colors.black;
                      });
                    },
                    child: const Text('हिंदी'),
                  ),
                ],
              ),
            ),
            buildVideoList(),
          ],
        ),
      ),
    );
  }

  Widget buildVideoList() {
    return Expanded(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  currentTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentVideoList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final videoId = currentVideoList.values.toList()[index];
                return ListTile(
                  leading: Image.network(
                    getThumbnailUrl(videoId),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    currentVideoList.keys.toList()[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          videoName: currentVideoList.keys.toList()[index],
                          videoId: videoId,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
