@echo off
setlocal EnableDelayedExpansion
set HASHFILE=hashes.md5
set LOGFILE=verify_log.txt
set FAIL=0
set CURRENT=0
set COUNT=0
set MISSING_LIST=
set CORRUPT_LIST=
if exist "%LOGFILE%" del "%LOGFILE%"
if not exist "%HASHFILE%" (
    echo ERROR: %HASHFILE% not found.
    echo Press any key to exit...
    pause >nul
    exit /b
)
REM Count total files
for /f "usebackq delims=" %%A in ("%HASHFILE%") do set /a COUNT+=1
echo Total files to verify: %COUNT%
echo.
REM Verify each file
for /f "usebackq delims=" %%L in ("%HASHFILE%") do (
    set /a CURRENT+=1
    set LINE=%%L
    
    REM Extract hash (first 32 characters)
    set EXPECTED=!LINE:~0,32!
    
    REM Extract filename (everything after position 33)
    set FILE=!LINE:~33!
    
    echo [!CURRENT! / %COUNT%] Verifying "!FILE!"
    echo [!CURRENT! / %COUNT%] Verifying "!FILE!" >> "%LOGFILE%"
    
    if not exist "!FILE!" (
        echo MISSING: !FILE!
        echo MISSING: !FILE! >> "%LOGFILE%"
        set FAIL=1
        set MISSING_LIST=!MISSING_LIST!!FILE!;
    ) else (
        REM Check if file is empty (0 bytes)
        set FILESIZE=0
        for %%S in ("!FILE!") do set FILESIZE=%%~zS
        
        if !FILESIZE!==0 (
            REM Empty file - use standard empty file MD5
            set ACTUAL=d41d8cd98f00b204e9800998ecf8427e
        ) else (
            REM Non-empty file - calculate hash
            set ACTUAL=
            for /f "skip=1 delims=" %%H in ('certutil -hashfile "!FILE!" MD5') do (
                if not defined ACTUAL (
                    set ACTUAL=%%H
                    set ACTUAL=!ACTUAL: =!
                )
            )
        )
        
        if /I not "!EXPECTED!"=="!ACTUAL!" (
            echo CORRUPT: !FILE!
            echo   Expected: !EXPECTED!
            echo   Got:      !ACTUAL!
            echo CORRUPT: !FILE! >> "%LOGFILE%"
            echo   Expected: !EXPECTED! >> "%LOGFILE%"
            echo   Got:      !ACTUAL! >> "%LOGFILE%"
            set FAIL=1
            set CORRUPT_LIST=!CORRUPT_LIST!!FILE!;
        ) else (
            echo OK
        )
    )
)
echo.
echo. >> "%LOGFILE%"
if "%FAIL%"=="0" (
    echo SUCCESS: All files verified correctly.
    echo SUCCESS: All files verified correctly. >> "%LOGFILE%"
) else (
    echo WARNING: Some files failed verification.
    echo WARNING: Some files failed verification. >> "%LOGFILE%"
    echo. >> "%LOGFILE%"
    
    if defined MISSING_LIST (
        echo MISSING FILES:
        echo MISSING FILES: >> "%LOGFILE%"
        for %%F in ("!MISSING_LIST:;=" "!") do (
            if not "%%~F"=="" (
                echo   %%~F
                echo   %%~F >> "%LOGFILE%"
            )
        )
        echo. >> "%LOGFILE%"
    )
    
    if defined CORRUPT_LIST (
        echo CORRUPT FILES:
        echo CORRUPT FILES: >> "%LOGFILE%"
        for %%F in ("!CORRUPT_LIST:;=" "!") do (
            if not "%%~F"=="" (
                echo   %%~F
                echo   %%~F >> "%LOGFILE%"
            )
        )
    )
)
echo.
echo Press any key to exit...
pause >nul