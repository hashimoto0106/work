@echo off
echo �t�B���^���o�e�L�X�g���O�ϊ�
pushd %~dp0
tshark -r ./binary.pcap > ./text.log 'tcp.port==80' -n
pause
