---------------------------------------------
-- �ڑ������ʒm
---------------------------------------------
function OnConnected()
    Logput(1,'OnConnected')
    Logput(1,'----- Start R5001 RSP Simulator -----')
    SetTimer( 0, 3000 )  --�^�C�}1 3000[ms] ��������
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
        bit_data = FileRead( '.\\R5001\\DP_BIT�f�[�^.bin' )
        SendData(bit_data)
        
        -- �n�ؑ֐���f�[�^���M
        Logput(1,'�n�ؑ֐���f�[�^���M')
        send_data = FileRead( '.\\R5001\\DP_�n�ؑ֐���f�[�^_DP-A�n�^�p.bin' )
        SendData(send_data)
    else
        -- Helth Check���M
        Logput(1,'Helth Check���M')
        healthcheck = FileRead( '.\\R5001\\HealthCheck.bin' )
        SendData(healthcheck)
    end
    return 0
end
---------------------------------------------
-- ��M�ʒm
---------------------------------------------
function OnReceive(recv)
    Logput(1,'OnReceive')
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


