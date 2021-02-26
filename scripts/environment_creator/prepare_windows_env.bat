set CURRENT_PATH=%~dp0
set SCRIPTS_PATH=%CURRENT_PATH%..
set ENV_PATH=%SCRIPTS_PATH%\..\environments\AdaptLabWinEnv
set LOG_FILE=%CURRENT_PATH%\windows_env_creation_log.txt

mkdir %ENV_PATH%
copy /y %CURRENT_PATH%\requirements.txt %ENV_PATH%\requirements.txt
if %ERRORLEVEL% NEQ 0 (
	echo Error during copying requirements.txt file > %LOG_FILE%
	exit 1
)
echo Copying requirements.txt file successful > %LOG_FILE%

pip install virtualenv==16.7.6
if %ERRORLEVEL% NEQ 0 (
	echo Error during installation of virtualenv >> %LOG_FILE%
	exit 1
)
echo virtualenv installation is successful >> %LOG_FILE%

cd /d %ENV_PATH%
if not exist %ENV_PATH%\Scripts\activate.bat (
    virtualenv .
)
if %ERRORLEVEL% NEQ 0 (
	echo Error during create virtualenv >> %LOG_FILE%
	exit 1
)
echo Create virtualenv is successful >> %LOG_FILE%

call %ENV_PATH%\Scripts\activate.bat
if %ERRORLEVEL% NEQ 0 (
	echo Error during run activate.bat >> %LOG_FILE%
	exit 1
)
echo Run activate.bat is successful >> %LOG_FILE%

pip install -r %ENV_PATH%\requirements.txt
if %ERRORLEVEL% NEQ 0 (
	echo Error during gathering dependencies >> %LOG_FILE%
	exit 1
)
echo Gathering dependencies is successful >> %LOG_FILE%
echo All steps are successful!
echo Your environment is ready on %ENV_PATH% >> %LOG_FILE%
exit 0