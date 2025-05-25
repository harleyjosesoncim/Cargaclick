@echo off
REM download_beat.bat – Baixa um arquivo MP3 a partir de uma URL via PowerShell

REM Verifica parâmetros
if "%~1"=="" (
  echo Uso: download_beat.bat [URL_do_beat] [nome_de_saida.mp3]
  echo Exemplo: download_beat.bat "https://example.com/beat.mp3" "beat_cargaclik.mp3"
  goto :eof
)

REM Define URL e nome de arquivo de saída
set "URL=%~1"
if "%~2"=="" (
  set "OUTFILE=beat_cargaclik.mp3"
) else (
  set "OUTFILE=%~2"
)

REM Cria pasta destino se não existir
if not exist "Audio\Instrumental" (
  mkdir "Audio\Instrumental"
)

REM Executa download via PowerShell
echo Baixando %URL% para Audio\Instrumental\%OUTFILE% ...
powershell -Command "try { Invoke-WebRequest -Uri '%URL%' -OutFile 'Audio\Instrumental\%OUTFILE%'; exit 0 } catch { Write-Error 'Falha no download'; exit 1 }"

if %errorlevel% equ 0 (
  echo Download concluido com sucesso!
) else (
  echo Ocorreu um erro durante o download.
)

pause
