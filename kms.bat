
@echo off
chcp 65001
set /p NCTU_USER="NCTU_USER: "
set /p NCTU_PASS="NCTU_PASSWORD: "
cls

echo 請以系統管理員執行
pause
echo 
echo 連線認證網頁
curl -d "mailaccount=%NCTU_USER%&mailserver=nctu.edu.tw&password=%NCTU_PASS%&Submit=送出" https://kmserv.nctu.edu.tw/login-email.php >%TEMP%\out.txt
find "ff0000" %TEMP%\out.txt
del %TEMP%\out.txt
echo 認證完畢後按任意鍵繼續
pause


slmgr -skms kmserv.nctu.edu.tw
slmgr -ato
slmgr -dlv
pause



echo 偵測 Microsoft Office 2013 安裝目錄
set OfficePath="None"

if exist "C:\Program Files\Microsoft Office\Office15\" set OfficePath="C:\Program Files\Microsoft Office\Office15\"
if exist "C:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" set OfficePath="C:\Program Files (x86)\Microsoft Office\Office15\"

if %OfficePath% == "None" (
echo 找不到Office 2013, 結束!
pause
exit
)

For /F "tokens=2 delims=[]" %%G in ('ver') Do (set _version=%%G) 
For /F "tokens=2 delims=. " %%G in ('echo %_version%') Do (set _major=%%G) 
if "%_major%"=="5" (echo 重啟 KMS 金鑰管理伺服器
cscript %OfficePath%ospp.vbs /osppsvcrestart)
echo 設定 KMS 金鑰管理伺服器
cscript %OfficePath%ospp.vbs /sethst:kmserv.nctu.edu.tw
cscript %OfficePath%ospp.vbs /setprt:1688
echo 啟動 Microsoft Office 2010
cscript %OfficePath%ospp.vbs /act
echo 啟動程序執行完成
echo 請注意: 上方(約前五行)需有 Product activation successful 出現,
echo 才表示您的 Office2013 啟動成功!
pause