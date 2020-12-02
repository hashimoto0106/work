@echo off
echo パケットキャプチャしバイナリログ保存します
pushd %~dp0
tshark -i 3 -w ./binary.pcap -a duration:1
echo ネットワークログ取得完了
pause
