@echo off
cmd /k "venv\Scripts\activate.bat && uvicorn main:app --reload"
