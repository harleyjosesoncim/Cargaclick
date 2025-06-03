from moviepy.editor import VideoFileClip, AudioFileClip
from pydub.generators import Sine
from pydub import AudioSegment
import os

# Caminho do vídeo
video_path = "Ecola de Gestão 2025 Neia.mp4"

# Verifica se o vídeo existe
if not os.path.exists(video_path):
    print(f"Vídeo '{video_path}' não encontrado.")
    input("Pressione Enter para sair...")
    exit(1)

# Processa o vídeo
video = VideoFileClip(video_path).resize(height=480).crop(width=854, x_center=640)
video = video.subclip(0, min(video.duration, 7 * 60 + 59))

# Cria música ambiente
ambient = Sine(432).to_audio_segment(duration=video.duration * 1000)
ambient = ambient - 25
musica_path = "musica_estilo_enya.mp3"
ambient.export(musica_path, format="mp3")

# Adiciona música ao vídeo
musica = AudioFileClip(musica_path).set_duration(video.duration).volumex(0.3)
video_final = video.set_audio(musica)

# Salva o vídeo final
output_path = r"C:\Users\User\video da neia\video_final_editado.mp4"
os.makedirs(os.path.dirname(output_path), exist_ok=True)
video_final.write_videofile(output_path, codec="libx264", audio_codec="aac")

print(f"Vídeo salvo em: {output_path}")
input("Pressione Enter para sair...")
