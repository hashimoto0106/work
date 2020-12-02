@echo off
echo フィルタ抽出テキストログ変換
pushd %~dp0
tshark -r ./binary.pcap > ./text.log 'tcp.port==80' -n
pause
