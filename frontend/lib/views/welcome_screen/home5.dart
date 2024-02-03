import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/person_controller.dart';
import 'package:frontend/views/welcome_screen/home.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen5 extends StatefulWidget {
  const HomeScreen5({super.key});

  @override
  State<HomeScreen5> createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> {
  String selectedJourney = "";
  bool j1 = false;
  bool j2 = false;
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
                value: 1.0, // 0.0 to 1.0
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
                          "Now let’s find the best place to start!",
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
            const Spacer(),
            Container(
              width: 320,
              height: 97,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: j1 ? Colors.green : whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset in the x, y direction
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Image.asset(
                    book,
                    width: 48,
                    height: 48,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                          child: Text("Start from the scratch",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Take the easiest lesson of the course",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              )),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ).onTap(() {
              setState(() {
                selectedJourney = "Start from the scratch";
                j1 = true;
                j2 = false;
              });
            }),
            const SizedBox(
              height: 23,
            ),
            Container(
              width: 320,
              height: 97,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: j2 ? Colors.green : whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset in the x, y direction
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Image.asset(
                    magnifyingGlass,
                    width: 48,
                    height: 48,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Finding my starting place",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              "Let Vani recommend where you should start learning",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              )),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ).onTap(() {
              setState(() {
                selectedJourney = "Finding my starting place";
                j1 = false;
                j2 = true;
              });
            }),
            // const Spacer(),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  PersonController.setUserJourney(selectedJourney);
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
                        'Continue O',
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
