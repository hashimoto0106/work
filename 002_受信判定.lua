---------------------------------------------
-- 接続完了通知
---------------------------------------------
function OnConnected()
    Logput(1,'OnConnected')
    Logput(1,'----- Start R5001 RSP Simulator -----')
    SetTimer( 0, 2000 )  --タイマ1 2000[ms] 周期発生
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
    if id == 0 then
        -- BITデータ送信
        Logput(1,'BITデータ送信')
        bit_data = FileRead('.\\R5001\\DP_BITデータ.bin')
        SendData(bit_data)
        
        -- 系切替制御データ送信
        Logput(1,'系切替制御データ送信')
        send_data = FileRead('.\\R5001\\DP_系切替制御データ_DP-A系運用.bin')
        SendData(send_data)
    else
        -- Helth Check送信
        Logput(1,'Helth Check送信')
        -- healthcheck = FileRead( '.\\R5001\\HealthCheck.bin')
        healthcheck = FileRead('HealthCheck.bin')
        SendData(healthcheck)
    end
    return 0
end
---------------------------------------------
-- 受信通知
---------------------------------------------
function OnReceive(recv)
    ------------------ 応答データ------------------
    -- SGC_駆動制御データ
    if recv[9] == 0x11 and recv[10] == 0x11 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[SGC_駆動制御データ応答]受信')
    -- DP_機器制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[DP_機器制御データ応答]受信')
    -- DP_BITデータ
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x11 then
        Logput(1,'[DP_BITデータ応答]受信')
    -- DP_系切替制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x12 then
        Logput(1,'[DP_系切替制御データ応答]受信')
    -- DP_駆動モード制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x13 then
        Logput(1,'[DP_駆動モード制御データ応答]受信')
    -- DP_時刻設定通知データ
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x14 then
        Logput(1,'[DP_時刻設定通知データ応答]受信')
    -- DP_リミットリセット制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x15 then
        Logput(1,'[DP_リミットリセット制御データ応答]受信')
    -- DP_Drive設定要求
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x16 then
        Logput(1,'[DP_Drive設定要求応答]受信')
    -- DP_駆動停止要求
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x17 then
        Logput(1,'[DP_駆動停止要求応答]受信')
    -- DP_運用開始要求
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x18 then
        Logput(1,'[DP_運用開始要求応答]受信')
    -- DP_運用停止要求
    elseif recv[9] == 0x11 and recv[10] == 0x21 and recv[11] == 0x00 and recv[12] == 0x19 then
        Logput(1,'[DP_運用停止要求応答]受信')

    ------------------ 結果データ------------------
    -- SGC_駆動制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x12 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[SGC_駆動制御データ結果]受信')
    -- DP_自己診断結果データ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[DP_自己診断結果データ]受信')
    -- DP_リセット指示結果データ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[DP_リセット指示結果データ]受信')
    -- DP_BITデータ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x11 then
        Logput(1,'[DP_BITデータ結果]受信')
    -- DP_系切替制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x12 then
        Logput(1,'[DP_系切替制御データ結果]受信')
    -- DP_駆動モード制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x13 then
        Logput(1,'[DP_駆動モード制御データ結果]受信')
    -- DP_時刻設定通知データ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x14 then
        Logput(1,'[DP_時刻設定通知データ結果咯受信')
    -- DP_リミットリセット制御データ
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x15 then
        Logput(1,'[DP_リミットリセット制御データ結果]受信')
    -- DP_Drive設定要求
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x16 then
        Logput(1,'[DP_Drive設定要求結果]受信')
    -- DP_駆動停止要求
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x17 then
        Logput(1,'[DP_駆動停止要求結果]受信')
    -- DP_運用開始要求
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x18 then
        Logput(1,'[DP_運用開始要求結果]受信')
    -- DP_運用停止要求
    elseif recv[9] == 0x11 and recv[10] == 0x22 and recv[11] == 0x00 and recv[12] == 0x19 then
        Logput(1,'[DP_運用停止要求結果]受信')
    -- 定義外
    else
        Logput(2,'★★★★★メッセージ番号定義外★★★★★')
    end


    ------------------ ステータスデータ受信------------------
    -- SGC_ステータスデータ
    if recv[9] == 0x11 and recv[10] == 0x13 and recv[11] == 0x00 and recv[12] == 0x01 then
        Logput(1,'[SGC_駆動制御データ結果]受信')
    end


    ------------------ 応答/結果コード詳細------------------
    -- 正常受付/正常終了
    if recv[21] == 0x00 and recv[22] == 0x00 and recv[23] == 0x00 and recv[24] == 0x00 then
        Logput(1,'[正常受付/正常終了]受信')

    -- 受付不可（データ不正）:メッセージサイズ不正
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x01 then
        Logput(1,'[受付不可（データ不正）:メッセージサイズ不正]受信')
    -- 受付不可（データ不正）:メッセージ番号不正
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x02 then
        Logput(1,'[受付不可（データ不正）:メッセージ番号不正]受信')
    -- 受付不可（データ不正）:データ配信用送信元機材番号
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x03 then
        Logput(1,'[受付不可（データ不正）:データ配信用送信元機材番号]受信')
    -- 受付不可（データ不正）:データ配信用送信先機材番号
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x04 then
        Logput(1,'[受付不可（データ不正）:データ配信用送信先機材番号]受信')
    -- 受付不可（データ不正）:データ部設定値不正
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x05 then
        Logput(1,'[受付不可（データ不正）:データ部設定値不正]受信')
    -- 受付不可（データ不正）:待機系装置制御データ受信
    elseif recv[21] == 0x70 and recv[22] == 0x01 and recv[23] == 0x00 and recv[24] == 0x06 then
        Logput(1,'[受付不可（データ不正）:待機系装置制御データ受信]受信')
        
        
    -- 受付不可（状態) : アクセスREMOTEではない
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x01 then
        Logput(1,'[受付不可（状態）: アクセスREMOTEではない ]受信')
    -- 受付不可（状態) : AZ/EL Drive ONではない
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x02 then
        Logput(1,'[受付不可（状態）: AZ/EL Drive ONではない ]受信')
    -- 受付不可（状態) : AZ/EL Drive OFFではない
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x03 then
        Logput(1,'[受付不可（状態）: AZ/EL Drive OFFではない ]受信')
    -- 受付不可（状態) : AZ/EL Drive not READY
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x04 then
        Logput(1,'[受付不可（状態）: AZ/EL Drive not READY ]受信')
    -- 受付不可（状態) : 指令角度が範囲外
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x05 then
        Logput(1,'[受付不可（状態）: 指令角度が範囲外 ]受信')
    -- 受付不可（状態) : REMOTE MAINT ONではない
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x06 then
        Logput(1,'[受付不可（状態）: REMOTE MAINT ONではない ]受信')
    -- 受付不可（状態) : 選択系で回線接続不良
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x07 then
        Logput(2,'[受付不可（状態）: 選択系で回線接続不良 ]受信')
    -- 受付不可（状態) : PROG SEL READYではない
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x08 then
        Logput(1,'[受付不可（状態）: PROG SEL READY ]受信')
    -- 受付不可（状態) : LIMIT RESET not READY
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x09 then
        Logput(1,'[受付不可（状態）: LIMIT RESET not READY ]受信')
    -- 受付不可（状態) : 運用中ではない
    elseif recv[21] == 0x70 and recv[22] == 0x02 and recv[23] == 0x00 and recv[24] == 0x0A then
        Logput(1,'[受付不可（状態）: 運用中ではない ]受信')
        
        
    -- 制御失敗 : 駆動が途中で停止(intlk等)
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x01 then
        Logput(1,'[制御失敗 : 駆動が途中で停止(intlk等) ]受信')
    -- 制御失敗 : 自己診断結果取得失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x02 then
        Logput(2,'[制御失敗 : 自己診断結果取得失敗 ]受信')
    -- 制御失敗 : BIT情報取得失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x03 then
        Logput(2,'[制御失敗 : BIT情報取得失敗 ]受信')
    -- 制御失敗 : 駆動モード移行失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x04 then
        Logput(2,'[制御失敗 : 駆動モード移行失敗 ]受信')
    -- 制御失敗 : NTP時刻取得失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x05 then
        Logput(2,'[制御失敗 : NTP時刻取得失敗 ]受信')
    -- 制御失敗 : 時刻設定失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x06 then
        Logput(1,'[制御失敗 : 時刻設定失敗 ]受信')
    -- 制御失敗 : リミットリセット失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x07 then
        Logput(1,'[制御失敗 : リミットリセット失敗 ]受信')
    -- 制御失敗 : DRIVE ONタイムアウト
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x08 then
        Logput(1,'[制御失敗 : DRIVE ONタイムアウト ]受信')
    -- 制御失敗 : リセット失敗
    elseif recv[21] == 0x70 and recv[22] == 0x03 and recv[23] == 0x00 and recv[24] == 0x09 then
        Logput(1,'[制御失敗 : リセット失敗 ]受信')
        
    -- 定義外
    else
        Logput(2,'★★★★★応答/結果コード定義外★★★★★')
    end

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



