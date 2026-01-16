@echo off
setlocal EnableDelayedExpansion
set HASHFILE=hashes.md5
if exist "%HASHFILE%" del "%HASHFILE%"

REM Count total files
set COUNT=0
for /r %%F in (*) do (
    if /I not "%%~nxF"=="%HASHFILE%" set /a COUNT+=1
)
echo Total files to hash: %COUNT%
echo.

REM Start hashing
set CURRENT=0
for /r %%F in (*) do (
    if /I not "%%~nxF"=="%HASHFILE%" (
        set /a CURRENT+=1
        echo [!CURRENT! / %COUNT%] Hashing %%F
        
        REM Check if file is empty
        if %%~zF==0 (
            echo d41d8cd98f00b204e9800998ecf8427e %%F>> "%HASHFILE%"
        ) else (
            REM Capture first line of hash output only
            set HASH=
            for /f "tokens=1" %%H in ('certutil -hashfile "%%F" MD5 ^| findstr /R "^[0-9a-fA-F]"') do (
                if not defined HASH set HASH=%%H
            )
            if defined HASH (
                echo !HASH! %%F>> "%HASHFILE%"
            ) else (
                echo ERROR: Could not hash %%F
            )
        )
    )
)

echo.
echo Hashing complete. Saved to %HASHFILE%.
pause