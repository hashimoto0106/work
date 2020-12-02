@echo off
echo タイムスタンプ YYYY-M-DD hh:mm:ss.ssssss
pushd %~dp0
tshark -w ./002_timestamp.pcap -a duration:3
pause
tshark -t ad -r ./002_timestamp.pcap > ./002_timestamp.log
pause
