REM for all examples
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\PSL_Papilio_Pro_LX9.xise start %%F\circuit\PSL_Papilio_Pro_LX9.xise && pause

echo "Change Xise project files to library now"
pause

REM for library circuit
cd libraries
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\PSL_Papilio_Pro_LX9.xise start %%F\circuit\PSL_Papilio_Pro_LX9.xise && pause
