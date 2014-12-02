for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\PSL_Papilio_DUO_LX9.xise copy Template_PSL_Base\circuit\PSL_Papilio_DUO_LX9.xise "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\PSL_Papilio_Pro_LX9.xise copy Template_PSL_Base\circuit\PSL_Papilio_Pro_LX9.xise "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\PSL_Papilio_One_250K.xise copy Template_PSL_Base\circuit\PSL_Papilio_One_250K.xise "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\circuit\PSL_Papilio_One_500K.xise copy Template_PSL_Base\circuit\PSL_Papilio_One_500K.xise "%%F"\*

for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\*.xise copy Template_PSL_Base\clean.bat "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\*.xise copy Template_PSL_Base\build_all.bat "%%F"\*
REM for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\*.xise copy Template_PSL_Base\import_libraries.xtcl "%%F"\*
REM for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\*.xise copy Template_PSL_Base\import_user_libraries.xtcl "%%F"\*

REM Update library files - Not needed anymore
REM for /f %%F in ('dir /AD /b') do xcopy ..\Libraries "%%F"\Libraries\ /E /Y
REM for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do copy Template_PSL_Base\clean.bat "%%F"\*
REM for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do copy Template_PSL_Base\build_all.bat "%%F"\*