import eng_to_ipa as ipa
from epitran import Epitran


def convert_eng_to_ipa_string(text: str):
    return ipa.convert(text)


def convert_text_to_ipa_list(text: str):
    return ipa.ipa_list(text)


def get_syllable_count(text: str):
    return ipa.syllable_count(text)


def convert_hin_to_ipa_string(text: str):
    epi = Epitran("hin-Deva")
    converted_str = epi.transliterate(text)
    return converted_str
