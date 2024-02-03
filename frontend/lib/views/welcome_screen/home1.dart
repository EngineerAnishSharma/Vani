import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/person_controller.dart';
import 'package:frontend/views/welcome_screen/home2.dart';
import 'package:get/get.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  String selectedLanguage = '';
  bool isHindiSelected = false;

  bool isEnglishSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              width: 167,
              height: 9,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF5538EE), width: 1.8),
                  borderRadius: BorderRadius.circular(5)),
              child: const LinearProgressIndicator(
                value: 0.2, // 0.0 to 1.0
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5538EE)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(cat),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 74,
                      width: 176,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        border: Border.all(
                            color: const Color(0xFF5538EE), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        child: AnimatedTextKit(
                          repeatForever: false,
                          animatedTexts: [
                            TyperAnimatedText(
                              "What language do want to use for Vani?",
                              speed: const Duration(milliseconds: 80),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Your Native Language",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 58,
                      width: 293,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF5538EE), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(usFlag),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "English",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "App Language",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHindiSelected = true;
                      isEnglishSelected = false;
                      selectedLanguage = "Hindi";
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 58,
                    width: 293,
                    decoration: BoxDecoration(
                      color: isHindiSelected ? Colors.green : whiteColor,
                      border:
                          Border.all(color: const Color(0xFF5538EE), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(letterHindi),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Hindi",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isHindiSelected = false;
                  isEnglishSelected = true;
                  selectedLanguage = "English";
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 58,
                width: 293,
                decoration: BoxDecoration(
                  color: isEnglishSelected ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(textaa),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "English",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  PersonController.setUserLanguage(selectedLanguage);
                  Get.to(() => const HomeScreen2());
                },
                child: Container(
                  height: 43,
                  width: 293,
                  // ignore: sort_child_properties_last
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      const Text(
                        'Continue   ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Image.asset(paw),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xFF5538EE),
                      borderRadius: BorderRadius.circular(30)),
                )),
            const SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
