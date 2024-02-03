import 'package:frontend/controllers/local_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataController {
  static const _progressKey = 'wrong_words';

  // Add a spoken word to the stored data
  static Future<void> addWrongWord(String word) async {
    Map<String, dynamic> wrongWords = await _getWrongWords();
    wrongWords[word] = (wrongWords[word] ?? 0) + 1;
    await _saveWrongWords(wrongWords);
  }

  // Get all wrong words and their frequencies from the stored data
  static Future<Map<String, dynamic>> getWrongWords() async {
    return await _getWrongWords();
  }

  // Clear all stored wrong words
  static Future<void> clearWrongWords() async {
    await LocalStorage.remove(_progressKey);
  }

  // Private method to retrieve wrong words and their frequencies from local storage
  static Future<Map<String, dynamic>> _getWrongWords() async {
    Map<String, dynamic> wrongWords =
        await LocalStorage.getMap(_progressKey, {});
    return wrongWords;
  }

  // Private method to save wrong words and their frequencies to local storage
  static Future<void> _saveWrongWords(Map<String, dynamic> wrongWords) async {
    await LocalStorage.setMap(_progressKey, wrongWords);
  }

  // Function to save wrong words and their frequencies to Firebase
  static Future<void> saveToFirebase(String userId) async {
    try {
      // Get the wrong words from local storage
      Map<String, dynamic> wrongWords = await _getWrongWords();

      // Connect to Firebase
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      // Define the Firestore collection reference
      CollectionReference userProgressCollection =
      firebaseFirestore.collection('user_data');

      // Save the wrong words to Firebase
      await userProgressCollection.doc(userId).set({
        'wrong_words': wrongWords,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear local storage after successful upload
      await clearWrongWords();
    } catch (e) {
      print('Error saving to Firebase: $e');
    }
  }
}
