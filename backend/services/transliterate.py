from englisttohindi.englisttohindi import EngtoHindi


class Transliterate:
    def __init(self):
        pass

    def hinglish_to_hindi(self, text: str):
        res = EngtoHindi(text)
        return {"hindi": res.convert}
