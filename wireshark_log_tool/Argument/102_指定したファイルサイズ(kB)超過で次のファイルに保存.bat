@echo off
echo �w�肵���t�@�C���T�C�Y(kB)���߂Ŏ��̃t�@�C���ɕۑ�
z:
cd Z:\Project\Tools\101_Wireshark\Argument
tshark -i 3 -s 12 -b filesize:100 -w ./binary.pcap -a duration:10
echo �l�b�g���[�N���O�擾����
pause
