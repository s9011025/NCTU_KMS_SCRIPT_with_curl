# 用途
一鍵式登入交大KMS及Windows Office 授權更新
# 程序說明
1. 工具
   * 使用curl 進行網頁認證, 目前使用版本為 7.55.1，可至 https://curl.haxx.se/windows/ 下載最新版
1. bat檔流程
   1. 輸入交大kms 帳密，如交大kms 網頁說明 https://kmserv.nctu.edu.tw/
   1. 以curl 登入驗證並回報結果
   1. 執行Windows 授權更新
   1. 執行Office 2013更新 (將偵測路徑，若沒有安裝則跳過)
1. 執行注意
   * 請以系統管理員權限執行
   
   ![run_as_admin](https://github.com/s9011025/NCTU_KMS_SCRIPT_with_curl/blob/master/run_as_admin.png)
   * 帳密認證一週最多五次，請謹慎使用
