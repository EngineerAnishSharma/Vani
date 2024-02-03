
import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/localization_controller.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({super.key});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          Loc.get["home_words"],
          style: const TextStyle(color: fontGrey),
        )),
        backgroundColor: whiteColor,
        body: const ImageCardListView());
  }
}

class ImageCardListView extends StatelessWidget {
  const ImageCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        String imageName =
            'assets/images/words_hindi/${index + 1}.png'; // Assuming the images are named index1.png, index2.png, ..., index100.png
        return ImageCard(imageName: imageName);
      },
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageName;

  const ImageCard({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imageName,
              height: 200.0, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
