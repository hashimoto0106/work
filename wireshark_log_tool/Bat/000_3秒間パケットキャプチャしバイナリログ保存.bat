@echo off
echo 3秒間パケットキャプチャしバイナリログ保存します
pushd %~dp0
tshark -i 3 -w ./000_binary.pcap -a duration:3
echo ネットワークログ取得完了
pause
