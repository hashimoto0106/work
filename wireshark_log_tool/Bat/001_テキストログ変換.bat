@echo off
echo テキストログ変換
pushd %~dp0
tshark -r ./000_binary.pcap > ./001_text.log
pause
