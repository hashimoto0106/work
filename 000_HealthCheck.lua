---------------------------------------------
-- 接続完了通知
---------------------------------------------
function OnConnected()
    Logput(1,'OnConnected')
    Logput(1,'----- Start R5001 RSP Simulator -----')
    SetTimer( 0, 3000 )  --タイマ1 3000[ms] 周期発生
    SetTimer( 1, 5000 )  --タイマ2 5000[ms] 周期発生
    return 0
end
---------------------------------------------
-- 送信ﾎﾞﾀﾝ押下
---------------------------------------------
function OnSendPush()
    Logput(1,'OnSendPush')
    a = GetEditorData()
    SendData(a)
    return 0
end
---------------------------------------------
-- ﾀｲﾏｰ通知
---------------------------------------------
function OnTimer(id)
    Logput(1,'OnTimer')
    if id == 0 then
    else
    	-- Helth Check送信
        Logput(1,'healthcheck')
	    healthcheck = FileRead( '.\\R5001\\HealthCheck.bin' )
	    SendData(healthcheck)
    end
    return 0
end
---------------------------------------------
-- 受信通知
---------------------------------------------
function OnReceive(recv)
    Logput(1,'OnReceive')
    return 0
end
---------------------------------------------
-- 切断通知
---------------------------------------------
function OnDisConnected()
    Logput(1,'OnDisConnected')
    Logput(1,'----- Stop R5001 RSP Simulator -----')
    return 0
end

