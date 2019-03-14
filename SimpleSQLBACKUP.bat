echo off
cls


:: Formato do Arquivo Nome-Data (exemplo>> MyDatabase-2009-5-19_1700.bak)

For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)


:: Parametros do Backup

set DATESTAMP=%mydate%_%mytime%
set DATABASENAME=Nome da base de dados 
set LOGIN=Login_Bancodedados;
set PASSWORD=Senha_Bancodedados;
set BACKUPFILENAME=C:\Backup\%DATABASENAME%-%DATESTAMP%.bak 
set BACKUPPATH=C:\Backup\ 
set SERVERNAME=NOMEDOSERVIDOR\INSTANCIA 

echo.
echo ----------------------------------------
echo - Backup em andamento
echo ----------------------------------------
echo - Instancia - %SERVERNAME%
echo - Banco de Dados - %DATABASENAME% 
echo - Dia e Horario - %DATESTAMP%
echo - Nome do arquivo de backup - %DATABASENAME%-%DATESTAMP%.bak 
echo - Local do arquivo - %BACKUPPATH%
echo ----------------------------------------

:: Comando no SQL via SQLCMD

sqlcmd -U %LOGIN% -P %PASSWORD% -S %SERVERNAME% -d master -Q "BACKUP DATABASE [%DATABASENAME%] TO DISK = N'%BACKUPFILENAME%' WITH INIT , NOUNLOAD , NAME = N'%DATABASENAME% backup', NOSKIP , STATS = 10, NOFORMAT"
echo.

:: Comando para deixar apenas os 2 backups mais recentes. Para mudar o numero basta alterar o parametro skip.

for /f "skip=2 delims=" %%F in ('dir %BACKUPPATH%\*.bak /s/b/o-d/a-d') do del "%%F"
pause