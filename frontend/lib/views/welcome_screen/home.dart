import 'package:flutter/material.dart';
import 'package:frontend/consts/colors.dart';
import 'package:frontend/controllers/home_controller.dart';
import 'package:frontend/english_section/ABC.dart';
import 'package:frontend/views/home_screen/home_screen.dart';
import 'package:frontend/views/play_ground_section/section_screen.dart';
import 'package:frontend/views/profile_screen/profile_screen.dart';
import 'package:frontend/widgets_common/exit_dailog.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // init home-controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      const Icon(
        Icons.home,
        size: 25,
        color: whiteColor,
      ),
      const Icon(
        Icons.book,
        size: 25,
        color: whiteColor,
      ),
      const Icon(
        Icons.abc,
        size: 25,
        color: whiteColor,
      ),
      const Icon(
        Icons.person,
        size: 25,
        color: whiteColor,
      ),
    ];

    var navbarBody = [
      HomeScreen(),
      const SectionScreen(),
      const ABC(),
      const ProfileScreen()
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                  child: navbarBody.elementAt(controller.currentNavindex.value),
                )),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: controller.currentNavindex.value,
          color: Colors.blue,

          backgroundColor: whiteColor,
          height: 55,
          animationDuration:
              const Duration(milliseconds: 500), // Adjust animation duration
          animationCurve: Curves.easeInOut, // Adjust animation curve
          items: navbarItem,
          onTap: (value) {
            controller.currentNavindex.value = value;
          },

          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
