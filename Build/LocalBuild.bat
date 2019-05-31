@ECHO OFF

ECHO +-------------------+
ECHO : Starting BUILD    :
ECHO +-------------------+
REM CALL %1\bin\ant -buildfile tSQLt.build.xml -Dmsbuild.path=%2 || goto :error

ECHO +-------------------+
ECHO : Copying BUILD     :
ECHO +-------------------+
REM CALL %1\bin\ant -buildfile tSQLt.copybuild.xml -debug|| goto :error

ECHO +-------------------+
ECHO : Validating BUILD  :
ECHO +-------------------+
CALL %1\bin\ant -buildfile tSQLt.validatebuild.xml -Ddb.version=%3 -Ddb.server=%4 -Ddb.name=%5 -debug|| goto :error

ECHO +-------------------+
ECHO : BUILD SUCCEEDED   :
ECHO +-------------------+
goto :EOF

:error
ECHO +-------------------+
ECHO : BUILD FAILED      :
ECHO +-------------------+
exit /b %errorlevel%


REM Override ignored for property