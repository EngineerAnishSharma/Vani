import numpy as np
import librosa
from fastdtw import fastdtw
from scipy.spatial.distance import cityblock
from scipy.stats import pearsonr
from scipy.spatial.distance import euclidean
from sklearn.metrics.pairwise import cosine_similarity
from pydub import AudioSegment

def load_audio(file_path):
    audio, _ = librosa.load(file_path, sr=None)
    return audio

def extract_mfcc(audio, sr):
    # Extract Mel-Frequency Cepstral Coefficients (MFCCs)
    mfcc = librosa.feature.mfcc(y=audio, sr=sr, n_mfcc=39)
    return mfcc

def detect_silence(audio, threshold=0.002, min_silence_duration=0.1):
    # Detect silence segments in the audio
    onset_frames = librosa.onset.onset_detect(y=audio, sr=len(audio), units='samples', backtrack=True)
    onset_times = librosa.samples_to_time(onset_frames, sr=len(audio))

    silence_segments = []
    start_time = 0.0

    for onset in onset_times:
        if onset - start_time >= min_silence_duration:
            silence_segments.append((start_time, onset))
        start_time = onset

    return silence_segments

def remove_silence(audio, silence_segments):
    # Remove silence segments from the audio
    non_silent_audio = np.concatenate([audio[int(start * len(audio)):int(end * len(audio))] for start, end in silence_segments])

    return non_silent_audio

def calculate_similarity_cosine(audio_file1, audio_file2):
    # Load audio files
    signal1, sr1 = load_audio(audio_file1), librosa.get_samplerate(audio_file1)
    signal2, sr2 = load_audio(audio_file2), librosa.get_samplerate(audio_file2)

    # Detect and remove silence segments
    silence_segments1 = detect_silence(signal1)
    silence_segments2 = detect_silence(signal2)

    non_silent1 = remove_silence(signal1, silence_segments1)
    non_silent2 = remove_silence(signal2, silence_segments2)

    # Extract MFCC features
    mfcc1 = extract_mfcc(non_silent1, sr1)
    mfcc2 = extract_mfcc(non_silent2, sr2)

    # Align the MFCC matrices by selecting the minimum number of frames
    min_frames = min(mfcc1.shape[1], mfcc2.shape[1])
    mfcc1 = mfcc1[:, :min_frames]
    mfcc2 = mfcc2[:, :min_frames]

    # Reshape MFCC matrices for cosine similarity calculation
    mfcc1_flat = mfcc1.flatten().reshape(1, -1)
    mfcc2_flat = mfcc2.flatten().reshape(1, -1)

    # Calculate cosine similarity
    similarity_matrix = cosine_similarity(mfcc1_flat, mfcc2_flat)

    # Get the similarity score from the matrix
    similarity_score = similarity_matrix[0, 0]

    return similarity_score


def calculate_similarity_pearson(audio_file1, audio_file2):
    # Load audio files
    signal1, sr1 = load_audio(audio_file1), librosa.get_samplerate(audio_file1)
    signal2, sr2 = load_audio(audio_file2), librosa.get_samplerate(audio_file2)

    # Detect and remove silence segments
    silence_segments1 = detect_silence(signal1)
    silence_segments2 = detect_silence(signal2)

    non_silent1 = remove_silence(signal1, silence_segments1)
    non_silent2 = remove_silence(signal2, silence_segments2)

    # Extract MFCC features
    mfcc1 = extract_mfcc(non_silent1, sr1)
    mfcc2 = extract_mfcc(non_silent2, sr2)

    # Align the MFCC matrices by selecting the minimum number of frames
    min_frames = min(mfcc1.shape[1], mfcc2.shape[1])
    mfcc1 = mfcc1[:, :min_frames]
    mfcc2 = mfcc2[:, :min_frames]

    # Reshape MFCC matrices for cosine similarity calculation
    mfcc1_flat = mfcc1.flatten().reshape(1, -1)
    mfcc2_flat = mfcc2.flatten().reshape(1, -1)

    # Calculate Pearson correlation coefficient
    correlation_coefficient, _ = pearsonr(mfcc1_flat[0], mfcc2_flat[0])

    # Convert correlation coefficient to similarity score
    similarity_score = (correlation_coefficient + 1) / 2

    return similarity_score

def calculate_similarity_fastdtw(audio_file1, audio_file2):
    # Load audio files
    signal1, sr1 = load_audio(audio_file1), librosa.get_samplerate(audio_file1)
    signal2, sr2 = load_audio(audio_file2), librosa.get_samplerate(audio_file2)

    # Detect and remove silence segments
    silence_segments1 = detect_silence(signal1)
    silence_segments2 = detect_silence(signal2)

    non_silent1 = remove_silence(signal1, silence_segments1)
    non_silent2 = remove_silence(signal2, silence_segments2)

    # Extract MFCC features
    mfcc1 = extract_mfcc(non_silent1, sr1)
    mfcc2 = extract_mfcc(non_silent2, sr2)

    # Align the MFCC matrices by selecting the minimum number of frames
    min_frames = min(mfcc1.shape[1], mfcc2.shape[1])
    mfcc1 = mfcc1[:, :min_frames]
    mfcc2 = mfcc2[:, :min_frames]

    # Reshape MFCC matrices for cosine similarity calculation
    # mfcc1_flat = mfcc1.flatten().reshape(1, -1)
    # mfcc2_flat = mfcc2.flatten().reshape(1, -1)
    mfcc1_flat = mfcc1.flatten()
    mfcc2_flat = mfcc2.flatten()
    
    # mfcc1 = (mfcc1 - np.mean(mfcc1)) / np.std(mfcc1)
    # mfcc2 = (mfcc2 - np.mean(mfcc2)) / np.std(mfcc2)


    distance, _ = fastdtw(mfcc1_flat, mfcc2_flat)

    # Convert distance to similarity score
    similarity_score = 1 / (1 + distance)

    return similarity_score


def calculate_similarity_manhattan(audio_file1, audio_file2):
    # Load audio files
    signal1, sr1 = load_audio(audio_file1), librosa.get_samplerate(audio_file1)
    signal2, sr2 = load_audio(audio_file2), librosa.get_samplerate(audio_file2)

    # Detect and remove silence segments
    silence_segments1 = detect_silence(signal1)
    silence_segments2 = detect_silence(signal2)

    non_silent1 = remove_silence(signal1, silence_segments1)
    non_silent2 = remove_silence(signal2, silence_segments2)

    # Extract MFCC features
    mfcc1 = extract_mfcc(non_silent1, sr1)
    mfcc2 = extract_mfcc(non_silent2, sr2)

    # Align the MFCC matrices by selecting the minimum number of frames
    min_frames = min(mfcc1.shape[1], mfcc2.shape[1])
    mfcc1 = mfcc1[:, :min_frames]
    mfcc2 = mfcc2[:, :min_frames]

    # Reshape MFCC matrices for cosine similarity calculation
    mfcc1_flat = mfcc1.flatten().reshape(1, -1)
    mfcc2_flat = mfcc2.flatten().reshape(1, -1)

    # Calculate cosine similarity
    similarity_matrix = cosine_similarity(mfcc1_flat, mfcc2_flat)

    distance = cityblock(mfcc1_flat, mfcc2_flat)

    # Convert distance to similarity score
    similarity_score = 1 / (1 + distance)

    return similarity_score


def calculate_similarity(audio_file1, audio_file2):
    one = calculate_similarity_cosine(audio_file1,audio_file2)
    # two = calculate_similarity_fastdtw(audio_file1,audio_file2)
    # # three = calculate_similarity_manhattan(audio_file1,audio_file2)
    # four = calculate_similarity_pearson(audio_file1,audio_file2)
    print(one)
    return one
    
def convert_mp3_to_wav(mp3_file, wav_file):
    # Load the MP3 file
    try:
        audio = AudioSegment.from_file(mp3_file, "mp3")
    except:
        audio = AudioSegment.from_file(mp3_file, format="mp4")

    # Convert the audio to WAV
    audio.export(wav_file, format="wav")