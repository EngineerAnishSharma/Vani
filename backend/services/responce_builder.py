from .constants import IPA_IMAGE_MAP, IGNORE_LIST
from pydantic import BaseModel
from .pronounciation import get_pronunciation_for
from .ipa_to_indices import *
from .text_to_ipa import *
from .transliterate import *
from .ipa_tongue import *


class Query(BaseModel):
    query: str


class IPAConverter:
    def __init__(self):
        pass

    def eng_to_ipa(self, query: str) -> dict:
        ipa = convert_eng_to_ipa_string(query)
        tongue_indices, tongue_failed = convert_ipa_to_tongue_indices(ipa)
        ipa_indices, ipa_failed = convert_ipa_to_indices(ipa)
        return {
            "ipa": ipa,
            "ipa_list": convert_text_to_ipa_list(query),
            "ipa_syllable_count": get_syllable_count(query),
            "ipa_indices": ipa_indices,
            "ipa_match_not_found": ipa_failed,
            "ipa_tongue": tongue_indices,
            "tongue_ipa_match_not_found": tongue_failed,
            "pronunciation": get_pronunciation_for(ipa)
        }

    def hin_to_ipa(self, query: str) -> dict:
        ipa = convert_hin_to_ipa_string(query)
        tongue_indices, tongue_failed = convert_ipa_to_tongue_indices(ipa)
        ipa_indices, ipa_failed = convert_ipa_to_indices(ipa)
        return {
            "ipa": ipa,
            "ipa_indices": ipa_indices,
            "ipa_match_not_found": ipa_failed,
            "ipa_tongue": tongue_indices,
            "tongue_ipa_match_not_found": tongue_failed,
            "pronunciation": get_pronunciation_for(ipa)
        }
