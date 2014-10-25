cd /D %~dp0

echo Importing User Libraries...

xtclsh import_user_libraries.xtcl 2> NUL
REM pause

REM xtclsh import_libraries.xtcl 2> NUL