import 'dart:math';

String generateRandomString() {
  List<String> stringList = [
    "Once upon a sunny day",
    "Teddy and bunny play",
    "Giggles in the meadow sweet",
    "Friendly dragon with tiny feet",
    "Magic in the starry night",
    "Puppies bark with such delight",
    "Hide and seek all day long",
    "Whispers in the bedtime tale",
    "Kites dancing in the gale",
    "Cupcakes with frosting yum too",
    "In the park laughter springs",
    "Butterflies and fairy wings",
    "Moonlit dreams softly sway",
    "Goodnight hugs end of day",
  ];


  Random random = Random();
  int index = random.nextInt(stringList.length);

  return stringList[index];
}
