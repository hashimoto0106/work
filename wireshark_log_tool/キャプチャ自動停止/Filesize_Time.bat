@echo off
echo �p�P�b�g�L���v�`�����o�C�i�����O1MB�ۑ����܂�
pushd %~dp0
tshark -i 3 -a filesize:1000 -a files:2 -w ./binary.pcap -a duration:0
echo �l�b�g���[�N���O�擾����
pause
