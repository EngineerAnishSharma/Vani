from typing import List
from fastapi.responses import JSONResponse
import uvicorn
from fastapi import FastAPI, File, UploadFile
from services.responce_builder import IPAConverter
from services.judge import *
from services.transliterate import Transliterate

tags_metadata = [
    {
        "name": "ipa",
        "description": "Convert *text* to **IPA** notations. Also get indices for mapping ipa to image.",
    },
    {
        "name": "transliteration",
        "description": "Convert **Hinglish** to **Hindi** or **English** to **Hindi**",
    },
]

app = FastAPI(
    title="Vani Backend",
    summary="Used for converting normal text to ipa and specific indices",
    openapi_tags=tags_metadata,
)


@app.get("/eng-to-ipa/", tags=["ipa"], name="English to IPA")
def eng_to_ipa(query: str) -> dict:
    """
    ## Converts English text to IPA notations.

    ### Args:
    - `query` *`(str)`*: The input English text to be converted.

    ### Returns:
    - dict: IPA conversion result with detailed information.
    - `ipa` *`(str)`*: The converted IPA notation.
    - `ipa_list` *`(List[List[str]])`*: List of IPA notations.
    - `ipa_syllable_count` *`(int)`*: Count of IPA syllables.
    - `ipa_indices` *`(List[int])`*: Indices for mapping IPA to image.
    - `ipa_match_not_found` *`(str)`*: Match not found indicator in IPA.
    - `ipa_tongue` *`(List[int])`*: Tongue positions in IPA.
    - `tongue_ipa_match_not_found` *`(str)`*: Match not found indicator for tongue positions in IPA.
    """
    req = IPAConverter()
    res = req.eng_to_ipa(query)
    return res


@app.get("/hin-to-ipa/", tags=["ipa"], name="Hindi to IPA")
def hin_to_ipa(query: str) -> dict:
    """
    ## Converts Hindi text to IPA notations.

    ### Args:
    - `query` *`(str)`*: The input Hindi text to be converted.

    ### Returns:
    - dict: IPA conversion result with detailed information.
    - `ipa` *`(str)`*: The converted IPA notation.
    - `ipa_indices` *`(List[int])`*: Indices for mapping IPA to image.
    - `ipa_match_not_found` *`(str)`*: Match not found indicator in IPA.
    - `ipa_tongue` *`(List[int])`*: Tongue positions in IPA.
    - `tongue_ipa_match_not_found` *`(str)`*: Match not found indicator for tongue positions in IPA.
    """
    req = IPAConverter()
    res = req.hin_to_ipa(query)
    return res


@app.get("/to_hindi/", tags=["transliteration"], name="Transliterate")
def to_hindi(query: str) -> dict:
    """
    ## Transliterates text from Hinglish to Hindi.

    ### Args:
    - `query` *`(str)`*: The input Hinglish text to be transliterated.

    ### Returns:
    - dict: Transliteration result in Hindi.
    - `hindi` *`(str)`*: The transliterated Hindi text.
    """
    tr = Transliterate()
    res = tr.hinglish_to_hindi(query)
    return res


@app.get("/", tags=["check"], name="Systems Running")
def root() -> str:
    """
    ## A simple root endpoint to check if all systems are running.

    ### Returns:
    - `str`: A confirmation message indicating that all systems are running.
    """
    return "All Systems Running"


@app.post("/audio-similarity")
async def audio_similarity(
    file1: UploadFile = File(...)):
    file1_path = f"uploads/{file1.filename}"
    id=file1.filename.split("_")[0]
    with open(file1_path, "wb") as f1:
        f1.write(file1.file.read())

    convert_mp3_to_wav(file1_path,"uploads/temp.wav")

    similarity_score = calculate_similarity(file1_path,f"data/{id}.wav")
    print(similarity_score)

    return f"{similarity_score}"

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
