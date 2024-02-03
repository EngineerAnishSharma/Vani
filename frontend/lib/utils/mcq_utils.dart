import 'dart:math';

import 'package:frontend/consts/data/bilabial_data.dart';
import 'package:frontend/consts/data/dental_data.dart';
import 'package:frontend/consts/data/palatal_datat.dart';
import 'package:frontend/consts/data/retroflex_data.dart';
import 'package:frontend/consts/data/velar_data.dart';
import 'package:frontend/consts/data/vyanjans_data.dart';

import '../consts/data/swar_data.dart';

String getEnglishSound(String hindiLetter) {
  final Map<String, List<Object>> characterMap =
      swarArr.firstWhere((map) => map.containsKey(hindiLetter));

  if (characterMap.isNotEmpty) {
    return characterMap[hindiLetter]![0] as String;
  } else {
    return 'Not Found';
  }
}

List<String> getRandomEnglishSounds(String hindiLetter) {
  var mylist = swarArr;
  mylist.addAll(velarBarakhadi);
  mylist.addAll(palatalBarakhadi);
  mylist.addAll(dentalBarakhadi);
  mylist.addAll(retroflexBarakhadi);
  mylist.addAll(bilabialBarakhadi);
  mylist.addAll(vyanjansBarakhadi);

  final Map<String, List<Object>> characterMap = mylist
      .firstWhere((map) => map.containsKey(hindiLetter), orElse: () => {});

  if (characterMap.isNotEmpty) {
    List<String> englishSounds = [];

    String englishSound = characterMap[hindiLetter]![0] as String;
    englishSounds.add(englishSound);

    // Generate three additional random English sounds
    Random random = Random();
    while (englishSounds.length < 4) {
      int randomIndex = random.nextInt(mylist.length);
      String randomSound = mylist[randomIndex].values.first[0] as String;

      // Check if the random sound is not equal to the correct answer
      if (!englishSounds.contains(randomSound) && randomSound != englishSound) {
        englishSounds.add(randomSound);
      }
    }

    // Shuffle the list to make the order random
    englishSounds.shuffle();

    return englishSounds;
  } else {
    // Handle the case where the Hindi letter is not found
    return ['Not Found'];
  }
}
