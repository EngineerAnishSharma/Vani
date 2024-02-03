import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/person_controller.dart';
import 'package:frontend/views/welcome_screen/home4.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  String selectedLevel = '';
  bool level1 = false;
  bool level2 = false;
  bool level3 = false;
  bool level4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 167,
              height: 9,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF5538EE), width: 1.8),
                  borderRadius: BorderRadius.circular(5)),
              child: const LinearProgressIndicator(
                value: 0.6, // 0.0 to 1.0
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
                //
                Image.asset(cat),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 74,
                        width: 176,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(
                              color: const Color(0xFF5538EE), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          'How Much english do you know?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedLevel = "I just started learning English";
                  level1 = true;
                  level2 = false;
                  level3 = false;
                  level4 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: level1 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(vector),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        'I just started learning English',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedLevel = "I know some word and phrases";
                  level1 = false;
                  level2 = true;
                  level3 = false;
                  level4 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: level2 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(vector),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        'I know some word and phrases',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedLevel = "I can have a simple conversation";
                  level1 = false;
                  level2 = false;
                  level3 = true;
                  level4 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: level3 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(vector),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        'I can have a simple conversation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedLevel = "I am at intermediate level and above";
                  level1 = false;
                  level2 = false;
                  level3 = false;
                  level4 = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: level4 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(vector),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        'I am at intermediate level and above',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  PersonController.setUserLevel(selectedLevel);
                  Get.to(() => const HomeScreen4());
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
        ),
      ),
    );
  }
}
