pushd %~dp0
tshark -w ./004_hostip_filter.pcap -f "host 192.168.11.5" -f "port 80" -a duration:3
echo �L���v�`������
pause
echo �e�L�X�g�t�@�C���ɕϊ����܂�
tshark -r ./004_hostip_filter.pcap > ./004_hostip_filter.log
pause
