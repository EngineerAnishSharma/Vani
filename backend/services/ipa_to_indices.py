from .constants import IPA_IMAGE_MAP, IGNORE_LIST


def convert_ipa_to_indices(input_string: str) -> list[int]:
    result_indices = []
    unknown_ipa: str = ""
    i = 0
    while i < len(input_string):
        found_match = False

        # Try to find the longest match in IPA_IMAGE_MAP
        for length in range(len(input_string[i:]), 0, -1):
            current_substring = input_string[i : i + length]
            for key, symbols in IPA_IMAGE_MAP.items():
                if current_substring in symbols:
                    result_indices.append(key)
                    i += length
                    found_match = True
                    break
            if found_match:
                break

        # If no match is found, check if the character is in IGNORE_LIST
        if not found_match:
            current_char = input_string[i]
            if current_char in IGNORE_LIST:
                i += 1  # Ignore the character and move to the next
            else:
                result_indices.append(0)  # Add 0 for unmatched character
                unknown_ipa += current_char
                i += 1

    return result_indices, unknown_ipa
