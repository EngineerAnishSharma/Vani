import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/person_controller.dart';
import 'package:frontend/views/welcome_screen/home3.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  String selectedAge = '';
  bool is12 = false;
  bool is18 = false;
  bool is35 = false;
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
                value: 0.4, // 0.0 to 1.0
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
                      child: const Center(
                          child: Text(
                        'What is your age group?',
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
            Container(
              padding: const EdgeInsets.all(5),
              height: 58,
              width: 293,
              decoration: BoxDecoration(
                color: is12 ? Colors.green : whiteColor,
                border: Border.all(color: const Color(0xFF5538EE), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(group),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '12-18 years',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ).onTap(() {
              setState(() {
                is12 = true;
                is18 = false;
                is35 = false;
                selectedAge = "12-18 years";
              });
            }),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 58,
              width: 293,
              decoration: BoxDecoration(
                color: is18 ? Colors.green : whiteColor,
                border: Border.all(color: const Color(0xFF5538EE), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(group),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '18-35 years',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ).onTap(() {
              setState(() {
                is12 = false;
                is18 = true;
                is35 = false;
                selectedAge = "18-35 years";
              });
            }),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 58,
              width: 293,
              decoration: BoxDecoration(
                color: is35 ? Colors.green : whiteColor,
                border: Border.all(color: const Color(0xFF5538EE), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(group),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '35+ years',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ).onTap(() {
              setState(() {
                is12 = false;
                is18 = false;
                is35 = true;
                selectedAge = "35+ years";
              });
            }),
            const Spacer(),
            InkWell(
                onTap: () {
                  PersonController.setUserAge(selectedAge);
                  Get.to(() => const HomeScreen3());
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
