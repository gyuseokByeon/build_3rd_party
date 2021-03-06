@echo off
SETLOCAL

REM x64
rem Change OPENSSL_DIR to match your setup
set OPENSSL_DIR=C:\Programs\OpenSSL-Win64
set OPENSSL_INCLUDE=%OPENSSL_DIR%\include
set OPENSSL_LIB=%OPENSSL_DIR%\lib;%OPENSSL_DIR%\lib\VC
set INCLUDE=%INCLUDE%;%OPENSSL_INCLUDE%
set LIB=%LIB%;%OPENSSL_LIB%

rem Change MYSQL_DIR to match your setup
set MYSQL_DIR=C:\Programs\mysql-5.7.17-winx64
set MYSQL_INCLUDE=%MYSQL_DIR%\include
set MYSQL_LIB=%MYSQL_DIR%\lib
set INCLUDE=%INCLUDE%;%MYSQL_INCLUDE%
set LIB=%LIB%;%MYSQL_LIB%

for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.VisualStudio.Workload.NativeDesktop -property installationPath`) do (
    set InstallDir=%%i
)

call "%InstallDir%\Common7\Tools\VsDevCmd.bat" -arch=x64 -host_arch=x64
call buildwin 150 build shared both x64 nosamples notests

ENDLOCAL
