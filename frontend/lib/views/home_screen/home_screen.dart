import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/english_section/ABC.dart';
import 'package:frontend/utils/text_to_speech.dart';
import 'package:frontend/views/learning_screen/word_screen/word_screen.dart';
import 'package:frontend/views/learning_screen/speech_challenge_screen/speech_challenge_screen.dart';
import 'package:frontend/views/virtual_assitant/virtual_assistant_widget.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:frontend/views/learning_screen/letter_screen/letter_screen.dart';
import 'package:frontend/consts/images.dart';
import 'package:frontend/consts/colors.dart';
import 'package:frontend/consts/lists.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/random_sentence_generator.dart';
import '../learning_screen/practice_voice.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  void _onPracticePressed() async {
    String query = _textEditingController.text;

    // Determine the endpoint based on the selected language.
    String endpoint = "eng-to-ipa";

    // Construct the HTTP request URL.
    String url =
        "https://hookworm-heroic-evidently.ngrok-free.app/$endpoint/?query=$query";

    // Send the POST request.
    try {
      var response = await http.get(
        Uri.parse(url),
      );

      // Check the status code for a successful request (200 OK) or a validation error (422 Unprocessable Entity).
      if (response.statusCode == 200) {
        // Parse the response JSON.
        Map<String, dynamic> data = json.decode(response.body);

        // Extract the necessary data for the PracticeScreen.
        String devnagri = query;
        List<int> animationIndices = (data["ipa_indices"] as List<dynamic>)
            .map((e) => e as int)
            .toList();
        String pronunciation = data["pronunciation"];
        // Navigate to the PracticeScreen with the proper parameters.
        Get.to(() => PracticeScreen(
            pronunciation: pronunciation,
            lipsIndices: animationIndices,
            tongueIndices: [],
            devnagri: devnagri));
      } else if (response.statusCode == 422) {
        // Handle validation errors.
        Map<String, dynamic> errorData = json.decode(response.body);
        List<dynamic> details = errorData['detail'];

        // Print or handle the validation error details.
        for (var detail in details) {
          print('Validation Error: ${detail["msg"]}');
        }
      } else {
        // Handle other status codes if needed.
        print('Unexpected Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors.
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/catAnimation.gif',
                    width: 147,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Loc.get["home_welcome"],
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(vector9),
                                10.widthBox,
                                Image.asset(vector8),
                              ],
                            ),
                          ),
                          Text(Loc.get["home_tagline"],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )).onTap(() {
                            TextToSpeech.speakText(Loc.get["home_tagline"]);
                          })
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 343,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffd9f8ff)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 53,
                        height: 104,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor),
                        child: const Center(
                          child: Text("6",
                              style: TextStyle(
                                fontSize: 64,
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            bookWeb,
                            height: 70,
                          ),
                          const Text("Total Class",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue))
                        ],
                      ),
                      Container(
                        width: 133,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff199e8e)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text("Curriculum",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(circularIndicator),
                                  const Text("25",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400,
                                      ))
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text("*Completion",
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w300,
                                    )),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              10.heightBox,
              Container(
                alignment: Alignment.center,
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  // controller: ,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: const Icon(Icons.search).onTap(() {
                      _onPracticePressed();
                    }),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: Loc.get["home_search_placeholder"],
                    hintStyle: const TextStyle(color: textfieldGrey),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8.0),
                      child: Text(Loc.get["home_explore"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    VxSwiper.builder(
                        height: 150,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  HapticFeedback.heavyImpact();
                                  TextToSpeech.speakText(
                                      "अक्षरों के साथ अभ्यास करें");
                                case 1:
                                  HapticFeedback.heavyImpact();
                                  TextToSpeech.speakText(
                                      "अक्षरों के साथ अभ्यास करें");
                                case 2:
                                  HapticFeedback.heavyImpact();
                                  TextToSpeech.speakText(
                                      "शब्दों के साथ अभ्यास करें");
                                case 3:
                                  HapticFeedback.heavyImpact();
                                  TextToSpeech.speakText(
                                      "शब्दों के साथ अभ्यास करें");
                              }
                            },
                            onDoubleTap: () {
                              switch (index) {
                                case 0:
                                  Get.to(() => const LetterScreen());
                                case 1:
                                  Get.to(() => const ABC());
                                case 2:
                                  Get.to(() => const WordScreen());
                                case 3:
                                  Get.to(() => const WordScreen());
                              }
                            },
                            child: Image.asset(
                              sliderList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .shadowSm
                                .margin(const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2.0))
                                .make(),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                width: 343,
                height: 60,
                decoration: const BoxDecoration(color: Colors.pink),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10, left: 15),
                      child: Image.asset(alphabet_logo)),
                  Text(Loc.get["home_alphabets"],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ]),
              )
                  .box
                  .rounded
                  .white
                  .clip(Clip.antiAlias)
                  .shadowSm
                  .margin(const EdgeInsets.symmetric(horizontal: 8))
                  .make()
                  .onTap(() {
                HapticFeedback.heavyImpact();
                TextToSpeech.speakText(Loc.get["home_alphabets"]);
              }).onDoubleTap(() {
                Get.to(() => const LetterScreen());
              }),
              15.heightBox,
              Container(
                width: 343,
                height: 60,
                decoration: const BoxDecoration(color: Colors.blue),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10, left: 15),
                      child: Image.asset(letters_logo)),
                  Text(Loc.get["home_words"],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ]),
              )
                  .box
                  .rounded
                  .white
                  .clip(Clip.antiAlias)
                  .shadowSm
                  .margin(const EdgeInsets.symmetric(horizontal: 8))
                  .make()
                  .onTap(() {
                HapticFeedback.heavyImpact();
                TextToSpeech.speakText(Loc.get["home_words"]);
              }).onDoubleTap(() {
                Get.to(() => const WordScreen());
              }),
              15.heightBox,
              Container(
                width: 343,
                height: 60,
                decoration: const BoxDecoration(color: Colors.green),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10, left: 15),
                      child: Image.asset(sentence_logo)),
                  Text(Loc.get["home_sentences"],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ]),
              )
                  .box
                  .rounded
                  .white
                  .clip(Clip.antiAlias)
                  .shadowSm
                  .margin(const EdgeInsets.symmetric(horizontal: 8))
                  .make()
                  .onTap(() {
                HapticFeedback.heavyImpact();
                TextToSpeech.speakText(Loc.get["home_sentences"]);
              }).onDoubleTap(() {
                Get.to(() => SpeechChallengeScreen(
                    correctText: generateRandomString(),
                    onSuccess: () {},
                    onFail: () {},
                    maxTries: 10));
              }),
              20.heightBox,
            ],
          ),
        ),
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
                child: VirtualAssistantWidget(
                  text: [
                    Loc.get['h1'],
                    Loc.get['h2'],
                    Loc.get['h3'],
                    Loc.get['h4'],
                    Loc.get['h5'],
                    Loc.get['h6'],
                    Loc.get['h7'],
                    Loc.get['h8']
                  ],
                  imagePaths: const [
                    'assets/images/homeAssistant/home1.png',
                    'assets/images/homeAssistant/home2.png',
                    'assets/images/homeAssistant/home3.png',
                    'assets/images/homeAssistant/home4.png',
                    'assets/images/homeAssistant/home5.png',
                    'assets/images/homeAssistant/home6.png',
                    'assets/images/homeAssistant/home7.png',
                    'assets/images/homeAssistant/home8.png',
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
