import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/consts/firebase_const.dart';
import 'package:get/get.dart';

class PersonController extends GetxController {
  static Future<void> setUserLanguage(String language) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'language': language,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserAge(String age) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'age': age,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserLevel(String level) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'level': level,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserTarget(String target) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'daily_target': target,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserJourney(String journey) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'journey': journey,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserRecord(String record) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'record': record,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }
}
