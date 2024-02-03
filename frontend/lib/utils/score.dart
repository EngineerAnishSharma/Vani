import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Score {
  static String suggestion = ''; // Store only the first suggestion

  static void compareStrings(String correctString, String userString) async {
    List<String> correctWords = correctString.split(' ');
    List<String> userWords = userString.split(' ');

    suggestion = ''; // Clear the previous suggestion

    int minLength = correctWords.length < userWords.length
        ? correctWords.length
        : userWords.length;

    for (int i = 0; i < minLength; i++) {
      if (correctWords[i].toLowerCase() != userWords[i].toLowerCase()) {
        String correctWord = correctWords[i];

        // Use eng-to-ipa API to get IPA notation for correct word
        String correctWordIPA = await getIPA(correctWord);

        suggestion = correctWordIPA.isNotEmpty
            ? 'Pronunciation tip: $correctWordIPA'
            : 'No pronunciation suggestion available.';
        break; // Exit the loop after capturing the first suggestion
      }
    }

    // Check for missing words in user input
    if (userWords.length < correctWords.length && suggestion.isEmpty) {
      for (int i = minLength; i < correctWords.length; i++) {
        String missingWord = correctWords[i];

        // Use eng-to-ipa API to get IPA notation for missing word
        String missingWordIPA = await getIPA(missingWord);

        suggestion = missingWordIPA.isNotEmpty
            ? 'Pronunciation tip: $missingWordIPA'
            : 'No pronunciation suggestion available.';
        break; // Exit the loop after capturing the first suggestion
      }
    }
  }

  /// @returns result
  /// result.acuracy: float
  /// result.suggestions: String
  /// result.ipa : String
  static Future<Map<String, dynamic>> evaluateText(
      String correctString, String userString) async {
    Map<String, dynamic> result = {
      'accuracy': 0.0,
      'suggestions': '',
      'ipa': '',
    };

    List<String> correctWords = correctString.split(' ');
    List<String> userWords = userString.split(' ');

    suggestion = ''; // Clear the previous suggestion
    result['accuracy'] = calculateAccuracy(correctWords, userWords);
    result['suggestions'] = suggestion;
    result['ipa'] = await getIPA(result['suggestions']);

    return result;
  }

  static double calculateAccuracy(
      List<String> correctWords, List<String> userWords) {
    int correctCount = 0;
    int totalCount = correctWords.length;

    int minLength = correctWords.length < userWords.length
        ? correctWords.length
        : userWords.length;

    for (int i = 0; i < minLength; i++) {
      if (correctWords[i].toLowerCase() == userWords[i].toLowerCase()) {
        correctCount++;
      }
    }

    return correctCount / totalCount;
  }

  static Future<String> getIPA(String word) async {
    // Determine the endpoint based on the selected language.
    String endpoint = "eng-to-ipa";

    // Construct the HTTP request URL.
    // String url = "https://raccoon-calm-loudly.ngrok-free.app/$endpoint/";
    String url = "http://192.168.115.3:8000/$endpoint/";


    // Encode the query as the request body.
    Map<String, String> body = {"query": word};

    // Send the POST request.
    try {
      var response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
      );

      // Parse the response JSON.
      Map<String, dynamic> data = json.decode(response.body);

      // Assuming the API response has a key "ipa" containing the IPA notation
      return data["ipa"] ?? ''; // Return an empty string if not found
    } catch (e) {
      print("Error fetching IPA: $e");
      return ''; // Return an empty string in case of an error
    }
  }

  static List<InlineSpan> generateColoredText(
      String correctString, String userString) {
    List<String> correctWords = correctString.split(' ');
    List<String> userWords = userString.split(' ');

    List<InlineSpan> coloredText = [];

    int minLength = correctWords.length < userWords.length
        ? correctWords.length
        : userWords.length;

    for (int i = 0; i < minLength; i++) {
      if (correctWords[i].toLowerCase() != userWords[i].toLowerCase()) {
        coloredText.add(
          TextSpan(
            text: '${correctWords[i]} ',
            style: const TextStyle(color: Colors.red),
          ),
        );
      } else {
        coloredText.add(
          TextSpan(
            text: '${correctWords[i]} ',
            style: const TextStyle(color: Colors.green),
          ),
        );
      }
    }

    // Check for missing words in user input
    if (userWords.length < correctWords.length) {
      for (int i = minLength; i < correctWords.length; i++) {
        coloredText.add(
          TextSpan(
            text: '${correctWords[i]} ',
            style: const TextStyle(color: Colors.black),
          ),
        );
      }
    }

    return coloredText;
  }
}
