@echo off
echo �e�L�X�g���O�ϊ�
pushd %~dp0
tshark -r ./000_binary.pcap > ./001_text.log
pause
