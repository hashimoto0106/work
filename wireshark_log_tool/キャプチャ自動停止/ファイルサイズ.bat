@echo off
echo パケットキャプチャしバイナリログ1MB保存します
pushd %~dp0
tshark -i 3 -a filesize:1000 -a files:5 -w ./binary.pcap
echo ネットワークログ取得完了
pause
