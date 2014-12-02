REM Cleans all circuit files.
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base .git archive libraries"') do if exist "%%F"\circuit\clean.bat cd "%%F"\circuit\ & clean.bat & cd ..\..
REM cd libraries
REM for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\clean.bat cd "%%F"\circuit\ & clean.bat & pause & cd ..\..
REM pause
