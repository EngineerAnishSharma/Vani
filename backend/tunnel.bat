@echo off
start cmd /k "venv\Scripts\activate.bat && uvicorn main:app --reload"
start cmd /k "ngrok http --domain=hookworm-heroic-evidently.ngrok-free.app 8000"
