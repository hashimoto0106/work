@echo off
echo �p�P�b�g�L���v�`�����o�C�i�����O�ۑ����܂�
pushd %~dp0
tshark -i 8 -f "host 127.0.0.1" -f "port 10000" -a  duration:3
echo �l�b�g���[�N���O�擾����
pause
