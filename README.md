# ubuntu-install-wkhtmltopdf
ubuntu 快速安裝最新版的 wkhtmltopdf 套件

## 關於　About
藉由 shell script 簡單快速地安裝 wkhtmltopdf 官方最新版本。  
官方網站下載：https://wkhtmltopdf.org/downloads.html  
原始官方Github release 下載：https://github.com/wkhtmltopdf/wkhtmltopdf/releases

## 需求　Requirements
1. curl
2. sed
3. wget

## 使用說明　Manual
1. [Clone](https://github.com/hms5232/ubuntu-install-wkhtmltopdf.git) 或直接[下載zip檔案](https://github.com/hms5232/ubuntu-install-wkhtmltopdf/archive/master.zip)後取出對應的 shell script 檔案
2. 用`cd`指令移動到 shell 目錄
3. 執行`chmod +x <shell script which you want to execute>`來使 shell 檔案可執行
4. 執行`./<shell script name which you want to execute>`開始下載最新版本、安裝等程序（中間會需要使用者輸入密碼以執行 sudo 指令）  
  
※由於安裝套件指令`dpkg -i`需要 root 權限，如不想等到執行該指令時才輸入密碼，請在最後一步（執行 shell script）加上`sudo`  
※因為相關檔案為即時下載，作業時間會因為當下網路環境等有所變化，請耐心等待

## 許可　License
請見 [LICENSE 頁面](https://github.com/hms5232/ubuntu-install-wkhtmltopdf/blob/master/LICENSE)  。
  
See [LICENSE page](https://github.com/hms5232/ubuntu-install-wkhtmltopdf/blob/master/LICENSE).
