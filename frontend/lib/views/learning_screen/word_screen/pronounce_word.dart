

import 'package:frontend/consts/consts.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../practice_voice.dart';

class PronunciationSearchScreen extends StatefulWidget {
  const PronunciationSearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PronunciationSearchScreenState createState() =>
      _PronunciationSearchScreenState();
}

class _PronunciationSearchScreenState extends State<PronunciationSearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _selectedLanguage = "English"; // Default language

  void _onPracticePressed() async {
    String query = _textEditingController.text;

    // Determine the endpoint based on the selected language.
    String endpoint;
    if (_selectedLanguage == "English") {
      endpoint = "eng-to-ipa";
    } else {
      endpoint = "hin-to-ipa";
    }

    // Construct the HTTP request URL.
    String url = "https://hookworm-heroic-evidently.ngrok-free.app/$endpoint/";
    // String url = "http://192.168.115.3:8000/$endpoint/";
    // Encode the query as the request body.
    Map<String, String> body = {"query": query};

    // Send the POST request.
    try {
      var response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
      );

      // Parse the response JSON.
      Map<String, dynamic> data = json.decode(response.body);

      // Extract the necessary data for the PracticeScreen.
      String devnagri = query;
      List<int> animationIndices =
          (data["ipa_indices"] as List<dynamic>).map((e) => e as int).toList();

      // Navigate to the PracticeScreen with the proper parameters.

      Get.to(() => PracticeScreen(
          lipsIndices: animationIndices,
          tongueIndices: [],
          devnagri: devnagri));
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text("Pronunciation Search"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: "Enter text",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items: <String>['English', 'Hindi']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onPracticePressed,
                child: const Text("Practice"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
