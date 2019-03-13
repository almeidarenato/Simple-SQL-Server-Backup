# sqlserversimplebackup
Script para task scheduler feito no .bat para backup de SQL Server

# Defina os parametros para informar a base onde deseja fazer o backup

*DATABASENAME = Nome da Base de Dados 
*LOGIN = Login do usuário no sql 
*PASSWORD = Senha do usuário no sql
*SERVERNAME = Servidor + Instancia . Ex: SERVER01/INSTANCIA01
*BACKUPFILENAME = LOCAL+NOME DO ARQUIVO . Ex: C:\Backup\%DATABASENAME%-%DATESTAMP%.bak 
*BACKUPPATH = LOCAL do arquivo.