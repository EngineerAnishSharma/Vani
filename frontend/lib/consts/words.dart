import 'dart:math';

List<String> englishWords = [
  'Apple',
  'Sunshine',
  'Ocean',
  'Serene',
  'Laughter',
  'Enigma',
  'Harmony',
  'Luminous',
  'Whimsical',
  'Tranquil',
  'Mellifluous',
  'Cascade',
  'Jubilant',
  'Breathtaking',
  'Epiphany',
  'Resplendent',
  'Nebula',
  'Quixotic',
  'Cacophony',
  'Ineffable',
  'Vellichor',
  'Incandescent',
  'Ethereal',
  'Solitude',
];

String getEnglishWord() {
  Random random = Random();
  int index = random.nextInt(englishWords.length);
  return englishWords[index];
}

List<String> hindiWords = [
  'सेब',
  'खुशी',
  'समुंदर',
  'शांत',
  'हंसी',
  'रहस्य',
  'हारमोनी',
  'उज्ज्वल',
  'विचित्र',
  'शांतिपूर्ण',
  'मधुर',
  'प्रवाह',
  'आनंदमय',
  'आश्चर्यजनक',
  'प्रकाशमय',
  'आविर्भूत',
  'खगोलशास्त्र',
  'अद्भुत',
  'कठिनाई',
  'अनुपम',
  'अद्वितीय',
  'आत्मा',
  'अनुभव',
  'शानदार',
  'शांति',
];

String getHindiWord() {
  Random random = Random();
  int index = random.nextInt(hindiWords.length);
  return hindiWords[index];
}
