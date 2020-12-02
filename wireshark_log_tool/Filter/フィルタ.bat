@echo off
echo パケットキャプチャしバイナリログ保存します
pushd %~dp0
tshark -i 3 -f "tcp" -a  duration:3
echo ネットワークログ取得完了
pause
