pushd %~dp0
tshark -w ./005_bin_log.pcap -a duration:3
echo �L���v�`������
pause
echo �e�L�X�g�t�@�C���ɕϊ����܂�
tshark -r ./005_bin_log.pcap -T fields -E header=y -E separator=, -e frame.number -e frame.time_delta -e ip.src -e ip.dst -e _ws.col.Protocol -e frame.len  -e _ws.col.Info > ./005_csv_log.csv
pause

