import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/english_section/ABC.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class EnglishScreen extends StatefulWidget {
  const EnglishScreen({super.key});

  @override
  State<EnglishScreen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        HapticFeedback.heavyImpact();
        Get.to(() => const ABC());
      },
      child: const Text('English'),
    ));
  }
}
