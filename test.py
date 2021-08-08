from spleeter.separator import Separator
from spleeter.audio import STFTBackend
from spleeter.audio import Codec
from spleeter.utils import *
from spleeter import *


separator = Separator('spleeter:2stems',
                      stft_backend=STFTBackend.LIBROSA,
                      multiprocess=False)

original_audio_path="12345.mp3"
audio_dir="./"
separator.separate_to_file(str(original_audio_path), str(audio_dir), codec=Codec.MP3)
print("Separate the audio file successfully.")