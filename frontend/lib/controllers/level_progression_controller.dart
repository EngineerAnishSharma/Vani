import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/consts/consts.dart';
import 'package:frontend/controllers/local_storage.dart';

enum Module {
  swar,
  velar,
  palatal,
  retroflex,
  dental,
  bilabial,
  vyanjans,
  words,
  sentences
}

class LevelProgressionController {
  static const String _completePrefix = "complete_";
  static const String _unlockPrefix = "unlocked_";
  static const String _firebaseCollection =
      'progression_data'; // Update with your Firestore collection name
  static const Map<Module, int> maxCount = {
    Module.swar: 12,
    Module.velar: 5,
    Module.palatal: 5,
    Module.retroflex: 5,
    Module.dental: 5,
    Module.bilabial: 5,
    Module.vyanjans: 16,
    Module.words: 1,
    Module.sentences: 1,
  };

  static Future<void> unlockNextLevel(Module module) async {
    int currentUnlockedCount =
        await LocalStorage.getInt(_getKeyForUnlock(module), 0);
    currentUnlockedCount++;
    if (currentUnlockedCount > maxCount[module]!) {
      currentUnlockedCount = maxCount[module]!;
    }

    await LocalStorage.setInt(_getKeyForUnlock(module), currentUnlockedCount);
  }

  static Future<void> completeThisLevel(Module module) async {
    int currentCompletedCount =
        await LocalStorage.getInt(_getKeyForCompleted(module), 0);
    currentCompletedCount++;
    if (currentCompletedCount > maxCount[module]!) {
      currentCompletedCount = maxCount[module]!;
    }
    if (currentCompletedCount != maxCount[module]!) {
      unlockNextLevel(module);
    }
    if (currentCompletedCount == maxCount[module]!) {
      var nextModule = maxCount.keysList()[
          (maxCount.keysList().indexOf(module) + 1) % maxCount.length];
      if (maxCount.keysList().indexOf(nextModule) >
          maxCount.keysList().indexOf(module)) {
        unlockNextLevel(nextModule);
      }
    }

    await LocalStorage.setInt(
        _getKeyForCompleted(module), currentCompletedCount);
  }

  static Future<bool> isLevelUnlocked(Module module, int level) async {
    int currentUnlockCount =
        await LocalStorage.getInt(_getKeyForUnlock(module), 0);
    print(currentUnlockCount);
    if (currentUnlockCount >= level) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isLevelCompleted(Module module, int level) async {
    int currentCompleteCount =
        await LocalStorage.getInt(_getKeyForCompleted(module), 0);
    if (currentCompleteCount >= level) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> saveToFirebase(String userId) async {
    final CollectionReference<Map<String, dynamic>> progressionCollection =
        FirebaseFirestore.instance.collection(_firebaseCollection);

    // Get the progression data
    final progressionData = await _getProgressionData();

    // Save the progression data to Firestore
    await progressionCollection.doc(userId).set(progressionData);
  }

  static Future<Map<String, dynamic>> _getProgressionData() async {
    // Construct the progression data
    final Map<String, dynamic> progressionData = {};

    for (var module in Module.values) {
      progressionData['${module}_unlock'] =
          await LocalStorage.getInt(_getKeyForUnlock(module), 0);
      progressionData['${module}_complete'] =
          await LocalStorage.getInt(_getKeyForCompleted(module), 0);
    }

    return progressionData;
  }

  static _getKeyForUnlock(Module module) {
    return "$module.$_unlockPrefix.";
  }

  static _getKeyForCompleted(Module module) {
    return "$module.$_completePrefix.";
  }
}
