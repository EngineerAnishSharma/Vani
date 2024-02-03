from .constants import pronounce_dict


def get_pronunciation_for(ipa: str):
    pronounciation = ""
    for char in ipa:
        if char in pronounce_dict.keys():
            pronounciation += pronounce_dict[char]
        else:
            pronounciation += " "
        pronounciation += "·"
    return pronounciation
