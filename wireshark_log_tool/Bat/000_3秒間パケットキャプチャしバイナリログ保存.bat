@echo off
echo 3�b�ԃp�P�b�g�L���v�`�����o�C�i�����O�ۑ����܂�
pushd %~dp0
tshark -i 3 -w ./000_binary.pcap -a duration:3
echo �l�b�g���[�N���O�擾����
pause
