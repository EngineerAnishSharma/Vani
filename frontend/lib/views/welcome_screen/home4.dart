import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/person_controller.dart';
import 'package:frontend/views/welcome_screen/home.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({super.key});

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  String selectedTarget = '';
  bool target1 = false;
  bool target2 = false;
  bool target3 = false;
  bool target4 = false;
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
                value: 0.8, // 0.0 to 1.0
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
                      child: const Center(
                          child: Text(
                        "What is your daily target?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
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
                  selectedTarget = "5 mins/day";
                  target1 = true;
                  target2 = false;
                  target3 = false;
                  target4 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: target1 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "5 mins/day",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text("Relaxed",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      width: 10,
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
                  selectedTarget = "10 mins/day";
                  target1 = false;
                  target2 = true;
                  target3 = false;
                  target4 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: target2 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "10 mins/day",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text("Relaxed",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      width: 10,
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
                  selectedTarget = "15 mins/day";
                  target1 = false;
                  target2 = false;
                  target3 = true;
                  target4 = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: target3 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "15 mins/day",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text("Serious",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      width: 10,
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
                  selectedTarget = "20 mins/day";
                  target1 = false;
                  target2 = false;
                  target3 = false;
                  target4 = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 65,
                width: 293,
                decoration: BoxDecoration(
                  color: target4 ? Colors.green : whiteColor,
                  border: Border.all(color: const Color(0xFF5538EE), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "20 mins/day",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text("Great",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  PersonController.setUserTarget(selectedTarget);
                  Get.to(() => const Home());
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
