import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/consts/firebase_const.dart';
import 'package:frontend/consts/images.dart';
import 'package:frontend/utils/audio_player.dart';
import 'package:frontend/views/auth_screen/login_screen.dart';
import 'package:frontend/views/welcome_screen/home.dart';
import 'package:frontend/widgets_common/applogo_widget.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating a method to change the screen
  changeScreen() {

    AudioPlayerUtils.playAudioFromAssets("startup.mp3");
    Future.delayed(const Duration(seconds: 4), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgVani),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              50.heightBox,
              applogoWidget(),
              "Vani".text.size(32).white.fontWeight(FontWeight.w400).make(),
              "Welcome to Vani".text.size(22).white.make(),
              const Spacer(),
              // Add "From" text
              "From".text.size(18).white.make(),
              // Add developer logo
              Image.asset(
                'assets/devlogo.png',
                width: screenWidth / 4, // Set width as 1/5 of the screen width
              ),
              16.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
