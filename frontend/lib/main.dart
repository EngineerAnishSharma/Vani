import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/consts/colors.dart';
import 'package:frontend/controllers/local_storage.dart';
import 'package:frontend/controllers/localization_controller.dart';
import 'package:frontend/views/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBDFhTsV-u93Sv-4b1t9eiFUU7vKpw48Is",
      appId: "1:1055124582182:web:80b434bb095ff25799dbe7",
      messagingSenderId: "1055124582182",
      projectId: "code-voyagers",
      storageBucket: "code-voyagers.appspot.com",
      authDomain: "code-voyagers.firebaseapp.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  if (await LocalStorage.getBool("is_english", false)) {
    await Loc.get.initialize(locale: "en");
  } else {
    await Loc.get.initialize(locale: "hi");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            // set the bar
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
        ),
        // home: SpeechChallengeScreen(
        //     correctText: "Hello this is a test",
        //     onSuccess: () {},
        //     onFail: () {},
        //     maxTries: 10),
        home: const SplashScreen());
  }
}
