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
    Logput(1,'OnTimer')
    if id == 0 then
    else
    	-- Helth Check���M
        Logput(1,'healthcheck')
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

