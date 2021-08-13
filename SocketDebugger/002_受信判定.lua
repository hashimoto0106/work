---------------------------------------------
-- �ڑ������ʒm
---------------------------------------------
function OnConnected()
    Logput(1,'OnConnected')
    Logput(1,'----- Start R5001 RSP Simulator -----')
    SetTimer( 0, 2000 )  --�^�C�}1 2000[ms] ��������
    SetTimer( 1, 5000 )  --�^�C�}2 5000[ms] ��������
    return 0
end
---------------------------------------------
-- ���M���݉���
---------------------------------------------
function OnSendPush()
    Logput(1,'OnSendPush')
    a = GetEditorData()
    SendData(a)
    return 0
end
---------------------------------------------
-- ��ϰ�ʒm
---------------------------------------------
function OnTimer(id)
    if id == 0 then
        -- BIT�f�[�^���M
        Logput(1,'BIT�f�[�^���M')
        bit_data = FileRead('.\\R5001\\DP_BIT�f�[�^.bin')
        SendData(bit_data)
        
        -- �n�ؑ֐���f�[�^���M
        Logput(1,'�n�ؑ֐���f�[�^���M')
        send_data = FileRead('.\\R5001\\DP_�n�ؑ֐���f�[�^_DP-A�n�^�p.bin')
        SendData(send_data)
    else
        -- Helth Check���M
        Logput(1,'Helth Check���M')
        -- healthcheck = FileRead( '.\\R5001\\HealthCheck.bin')
        healthcheck = FileRead('HealthCheck.bin')
        SendData(healthcheck)
    end
    return 0
end
---------------------------------------------
-- ��M�ʒm
---------------------------------------------
function OnReceive(recv)
    ------------------ �����f�[�^------------------
    -- SGC_�쓮����f�[�^
    if recv[9] == 0x11 and recv[10] == 0x11 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[SGC_�쓮����f�[�^����]��M')
    -- DP_�@�퐧��f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[DP_�@�퐧��f�[�^����]��M')
    -- DP_BIT�f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x11 then
        Logput(1,'[DP_BIT�f�[�^����]��M')
    -- DP_�n�ؑ֐���f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x12 then
        Logput(1,'[DP_�n�ؑ֐���f�[�^����]��M')
    -- DP_�쓮���[�h����f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x13 then
        Logput(1,'[DP_�쓮���[�h����f�[�^����]��M')
    -- DP_�����ݒ�ʒm�f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x14 then
        Logput(1,'[DP_�����ݒ�ʒm�f�[�^����]��M')
    -- DP_���~�b�g���Z�b�g����f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x15 then
        Logput(1,'[DP_���~�b�g���Z�b�g����f�[�^����]��M')
    -- DP_Drive�ݒ�v��
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x16 then
        Logput(1,'[DP_Drive�ݒ�v������]��M')
    -- DP_�쓮��~�v��
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x17 then
        Logput(1,'[DP_�쓮��~�v������]��M')
    -- DP_�^�p�J�n�v��
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x18 then
        Logput(1,'[DP_�^�p�J�n�v������]��M')
    -- DP_�^�p��~�v��
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x19 then
        Logput(1,'[DP_�^�p��~�v������]��M')

    ------------------ ���ʃf�[�^------------------
    -- SGC_�쓮����f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x12 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[SGC_�쓮����f�[�^����]��M')
    -- DP_���Ȑf�f���ʃf�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[DP_���Ȑf�f���ʃf�[�^]��M')
    -- DP_���Z�b�g�w�����ʃf�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[DP_���Z�b�g�w�����ʃf�[�^]��M')
    -- DP_BIT�f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x11 then
        Logput(1,'[DP_BIT�f�[�^����]��M')
    -- DP_�n�ؑ֐���f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x12 then
        Logput(1,'[DP_�n�ؑ֐���f�[�^����]��M')
    -- DP_�쓮���[�h����f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x13 then
        Logput(1,'[DP_�쓮���[�h����f�[�^����]��M')
    -- DP_�����ݒ�ʒm�f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x14 then
        Logput(1,'[DP_�����ݒ�ʒm�f�[�^���ʚ]��M')
    -- DP_���~�b�g���Z�b�g����f�[�^
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x15 then
        Logput(1,'[DP_���~�b�g���Z�b�g����f�[�^����]��M')
    -- DP_Drive�ݒ�v��
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x16 then
        Logput(1,'[DP_Drive�ݒ�v������]��M')
    -- DP_�쓮��~�v��
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x17 then
        Logput(1,'[DP_�쓮��~�v������]��M')
    -- DP_�^�p�J�n�v��
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x18 then
        Logput(1,'[DP_�^�p�J�n�v������]��M')
    -- DP_�^�p��~�v��
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x19 then
        Logput(1,'[DP_�^�p��~�v������]��M')
    -- ��`�O
    else
        Logput(2,'�������������b�Z�[�W�ԍ���`�O����������')
    end


    ------------------ �X�e�[�^�X�f�[�^��M------------------
    -- SGC_�X�e�[�^�X�f�[�^
    if recv[9] == 0x11 and recv[10] == 0x13 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[SGC_�쓮����f�[�^����]��M')
    end


    ------------------ ����/���ʃR�[�h�ڍ�------------------
    -- �����t/����I��
    if recv[21] == 0x00 and recv[22] == 0x00 and recv[23] == 0x00 and recv[24] == 0x00 then
        Logput(1,'[�����t/����I��]��M')

    -- ��t�s�i�f�[�^�s���j:���b�Z�[�W�T�C�Y�s��
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x01 then
        Logput(1,'[��t�s�i�f�[�^�s���j:���b�Z�[�W�T�C�Y�s��]��M')
    -- ��t�s�i�f�[�^�s���j:���b�Z�[�W�ԍ��s��
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x02 then
        Logput(1,'[��t�s�i�f�[�^�s���j:���b�Z�[�W�ԍ��s��]��M')
    -- ��t�s�i�f�[�^�s���j:�f�[�^�z�M�p���M���@�ޔԍ�
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x03 then
        Logput(1,'[��t�s�i�f�[�^�s���j:�f�[�^�z�M�p���M���@�ޔԍ�]��M')
    -- ��t�s�i�f�[�^�s���j:�f�[�^�z�M�p���M��@�ޔԍ�
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x04 then
        Logput(1,'[��t�s�i�f�[�^�s���j:�f�[�^�z�M�p���M��@�ޔԍ�]��M')
    -- ��t�s�i�f�[�^�s���j:�f�[�^���ݒ�l�s��
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x05 then
        Logput(1,'[��t�s�i�f�[�^�s���j:�f�[�^���ݒ�l�s��]��M')
    -- ��t�s�i�f�[�^�s���j:�ҋ@�n���u����f�[�^��M
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x06 then
        Logput(1,'[��t�s�i�f�[�^�s���j:�ҋ@�n���u����f�[�^��M]��M')
        
        
    -- ��t�s�i���) : �A�N�Z�XREMOTE�ł͂Ȃ�
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x01 then
        Logput(1,'[��t�s�i��ԁj: �A�N�Z�XREMOTE�ł͂Ȃ� ]��M')
    -- ��t�s�i���) : AZ/EL Drive ON�ł͂Ȃ�
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x02 then
        Logput(1,'[��t�s�i��ԁj: AZ/EL Drive ON�ł͂Ȃ� ]��M')
    -- ��t�s�i���) : AZ/EL Drive OFF�ł͂Ȃ�
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x03 then
        Logput(1,'[��t�s�i��ԁj: AZ/EL Drive OFF�ł͂Ȃ� ]��M')
    -- ��t�s�i���) : AZ/EL Drive not READY
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x04 then
        Logput(1,'[��t�s�i��ԁj: AZ/EL Drive not READY ]��M')
    -- ��t�s�i���) : �w�ߊp�x���͈͊O
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x05 then
        Logput(1,'[��t�s�i��ԁj: �w�ߊp�x���͈͊O ]��M')
    -- ��t�s�i���) : REMOTE MAINT ON�ł͂Ȃ�
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x06 then
        Logput(1,'[��t�s�i��ԁj: REMOTE MAINT ON�ł͂Ȃ� ]��M')
    -- ��t�s�i���) : �I���n�ŉ���ڑ��s��
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x07 then
        Logput(2,'[��t�s�i��ԁj: �I���n�ŉ���ڑ��s�� ]��M')
    -- ��t�s�i���) : PROG SEL READY�ł͂Ȃ�
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x08 then
        Logput(1,'[��t�s�i��ԁj: PROG SEL READY ]��M')
    -- ��t�s�i���) : LIMIT RESET not READY
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x09 then
        Logput(1,'[��t�s�i��ԁj: LIMIT RESET not READY ]��M')
    -- ��t�s�i���) : �^�p���ł͂Ȃ�
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x0A then
        Logput(1,'[��t�s�i��ԁj: �^�p���ł͂Ȃ� ]��M')
        
        
    -- ���䎸�s : �쓮���r���Œ�~(intlk��)
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x01 then
        Logput(1,'[���䎸�s : �쓮���r���Œ�~(intlk��) ]��M')
    -- ���䎸�s : ���Ȑf�f���ʎ擾���s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x02 then
        Logput(2,'[���䎸�s : ���Ȑf�f���ʎ擾���s ]��M')
    -- ���䎸�s : BIT���擾���s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x03 then
        Logput(2,'[���䎸�s : BIT���擾���s ]��M')
    -- ���䎸�s : �쓮���[�h�ڍs���s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x04 then
        Logput(2,'[���䎸�s : �쓮���[�h�ڍs���s ]��M')
    -- ���䎸�s : NTP�����擾���s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x05 then
        Logput(2,'[���䎸�s : NTP�����擾���s ]��M')
    -- ���䎸�s : �����ݒ莸�s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x06 then
        Logput(1,'[���䎸�s : �����ݒ莸�s ]��M')
    -- ���䎸�s : ���~�b�g���Z�b�g���s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x07 then
        Logput(1,'[���䎸�s : ���~�b�g���Z�b�g���s ]��M')
    -- ���䎸�s : DRIVE ON�^�C���A�E�g
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x08 then
        Logput(1,'[���䎸�s : DRIVE ON�^�C���A�E�g ]��M')
    -- ���䎸�s : ���Z�b�g���s
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x09 then
        Logput(1,'[���䎸�s : ���Z�b�g���s ]��M')
        
    -- ��`�O
    else
        Logput(2,'��������������/���ʃR�[�h��`�O����������')
    end

    return 0
end
---------------------------------------------
-- �ؒf�ʒm
---------------------------------------------
function OnDisConnected()
    Logput(1,'OnDisConnected')
    Logput(1,'----- Stop R5001 RSP Simulator -----')
    return 0
end



