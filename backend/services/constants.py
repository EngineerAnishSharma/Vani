IPA_IMAGE_MAP = {
    0: ["Silence"],
    1: ["æ", "ʌ", "ə", "əʊ", "ɚ"],
    2: ["ɑː", "ɒ", "ɑ", "a"],
    3: ["ɔː", "ɔ"],
    4: ["ɛə", "ɛ", "ʊ", "ʊə", "e"],
    5: ["ɜː", "ɝ"],
    6: ["aɪ", "eɪ", "ɪ", "ɪə", "iː", "ɔɪ", "j", "i", "ɨ"],
    7: ["uː", "w", "u", "ju"],
    8: ["oʊ", "o"],
    9: ["aʊ"],
    10: ["ɔɪ"],
    11: ["aɪ"],
    12: ["h", "ɦ"],
    13: ["ɹ", "ɪɹ", "ɛɹ", "ʊɹ", "aɪɹ", "aʊɹ", "ɔɹ", "ɑɹ", "ɾ", "r̩", "r̩ː", "r"],
    14: ["l"],
    15: ["s", "z", "ʂ"],
    16: ["ʃ", "ʒ", "tʃ", "t͡ʃ", "t͡ʃʰ"],
    17: ["ð"],
    18: ["f", "v"],
    19: [
        "d",
        "d̤",
        "dʒ",
        "n",
        "t",
        "tʰ",
        "θ",
        "d͡ʒ̤",
        "d͡ʒ",
        "ʈ",
        "ʈʰ",
        "ɖ",
        "ɖ̤",
        "ɲ",
    ],
    20: ["g", "k", "ŋ", "ɡ", "kʰ", "ɡ̤", "ɳ"],
    21: ["b", "b̤", "m", "p", "pʰ"],
}

IGNORE_LIST = [
    "ˈ",
    "ˌ",
    ".",
    "ː",
    "‿",
]

IPA_TONGUE_MAP = {
    0: ["Silence"],
    1: ["t", "d", "d̤", "tʰ", "ʈ", "ʈʰ", "ɖ", "ɖ̤", "ɳ"],
    2: ["m"],
    3: ["k", "g", "ɡ̤", "kʰ", "ɡ"],
    4: ["ʃ", "ʒ", "ʂ", "tʃ", "t͡ʃ", "t͡ʃʰ", "d͡ʒ", "d͡ʒ̤"],
    5: ["s", "z"],
    6: ["l"],
    7: ["p", "b", "b̤", "pʰ"],
    8: ["n"],
    9: ["θ", "ð", "h", "ɦ"],
    10: ["f", "v"],
    11: ["j", "ɲ"],
    12: ["ŋ"],
    13: ["ɹ", "ɚ", "r̩", "r̩ː", "r", "ɪɹ"],
    14: ["ɨ"],
    15: ["w"],
    16: ["ʌ"],
    17: ["ʊ"],
    18: ["uː", "u"],
    19: ["ɑː"],
    20: ["iː", "i"],
    21: ["ɪ"],
    22: ["æ"],
    23: ["ə", "ɜː"],
    24: ["e", "ɛ"],
    25: ["ʒː"],
    26: ["ɔː"],
    27: ["ɒ", "ɑ", "a", "ɔ", "o"],
    28: ["ɪə"],
    29: ["eɪ", "ɛə"],
    30: ["ʊə"],
    31: ["ɔɪ"],
    32: ["əʊ", "oʊ"],
    33: ["eə"],
    34: ["aɪ"],
    35: ["aʊ"],
}

pronounce_dict = {
    "æ": "a",
    "ʌ": "uh",
    "ə": "uh",
    "əʊ": "uh-oh",
    "ɚ": "er",
    "ɑː": "ah",
    "ɒ": "aw",
    "ɑ": "ah",
    "a": "a",
    "ɔː": "aw",
    "ɔ": "aw",
    "ɛə": "eh-uh",
    "ɛ": "eh",
    "ʊ": "oo",
    "ʊə": "oo-uh",
    "e": "eh",
    "ɜː": "ur",
    "ɝ": "er",
    "aɪ": "ai",
    "eɪ": "ay",
    "ɪ": "ih",
    "ɪə": "ih-uh",
    "iː": "ee",
    "ɔɪ": "oy",
    "j": "y",
    "i": "ee",
    "ɨ": "ih",
    "uː": "oo",
    "w": "w",
    "u": "oo",
    "ju": "yoo",
    "oʊ": "ow",
    "o": "oh",
    "aʊ": "ow",
    "ɔɪ": "oy",
    "aɪ": "ai",
    "h": "h",
    "ɦ": "h",
    "ɹ": "r",
    "ɪɹ": "ir",
    "ɛɹ": "er",
    "ʊɹ": "oor",
    "aɪɹ": "air",
    "aʊɹ": "owr",
    "ɔɹ": "or",
    "ɑɹ": "ar",
    "ɾ": "r",
    "r̩": "r",
    "r̩ː": "r",
    "r": "r",
    "l": "l",
    "s": "s",
    "z": "z",
    "ʂ": "sh",
    "ʃ": "sh",
    "ʒ": "zh",
    "tʃ": "ch",
    "t͡ʃ": "ch",
    "t͡ʃʰ": "ch",
    "ð": "th",
    "f": "f",
    "v": "v",
    "d": "d",
    "d̤": "d",
    "dʒ": "j",
    "n": "n",
    "t": "t",
    "tʰ": "th",
    "θ": "th",
    "d͡ʒ̤": "j",
    "d͡ʒ": "j",
    "ʈ": "t",
    "ʈʰ": "th",
    "ɖ": "d",
    "ɖ̤": "d",
    "ɲ": "ny",
    "g": "g",
    "k": "k",
    "ŋ": "ng",
    "ɡ": "g",
    "kʰ": "kh",
    "ɡ̤": "g",
    "ɳ": "n",
    "b": "b",
    "b̤": "b",
    "m": "m",
    "p": "p",
    "pʰ": "ph",
}