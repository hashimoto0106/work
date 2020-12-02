@echo off
echo パケットキャプチャしバイナリログ保存します
pushd %~dp0
tshark -i 8 -f "host 127.0.0.1" -f "port 10000" -a  duration:3
echo ネットワークログ取得完了
pause
