@echo off

SETLOCAL
if "%1" == "" goto HELP

for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.VisualStudio.Workload.NativeDesktop -property installationPath`) do (
    set InstallDir=%%i
)

call "%InstallDir%\Common7\Tools\VsDevCmd.bat"
msbuild msbuild.xml %*

ENDLOCAL
exit /b %ERRORLEVEL%

:HELP
echo.
echo build_x86 [/t:^<target^>] [/p:^<parameter=value^>]
echo.
echo * target list
echo  - Clean: Clean projects
echo  - Build: Build projects
echo.
echo * parameter list (name = values)
echo  - Framework = gtest, gmock (default: gtest)
echo  - Configuration = Debug, Release (default: Debug)
echo.

:QUIT
