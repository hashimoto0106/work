##====================================================================
##
##====================================================================

BEGIN {
    SZ = 6                        # 盤面の枡目の数
    split("1 2 3 4 5 0", Goal)    # 目標状態の格納

    ##====  各位置での可能な操作
    Ope[1][1] = ""; split("0 1 0 1 0 0", Ope[1])
    Ope[2][1] = ""; split("1 0 1 0 1 0", Ope[2])
    Ope[3][1] = ""; split("0 1 0 0 0 1", Ope[3])
    Ope[4][1] = ""; split("1 0 0 0 1 0", Ope[4])
    Ope[5][1] = ""; split("0 1 0 1 0 1", Ope[5])
    Ope[6][1] = ""; split("0 0 1 0 1 0", Ope[6])

    ##====  入力と初期化
    getline $0;                               # 初期状態の入力
    State[0][1] = ""; split($0, State[0]);    # 初期状態の格納
    hd = 0; up[hd] = -1; p = hd;              # 初期状態

    ##====  操作
    while ( p <= hd ) {                                           # 飽和まで
        if ( get_fin(State[p]) ) { solution(State, p); exit; }    # 解法終了
        z = arr_pos(State[p], SZ, 0);                             # 空枡位置
        for ( k = 1; k <= SZ; k++ ) {                             # 操作候補
            if ( Ope[z][k] == 0 )  continue                       # 適用条件
            arr_copy(nx, State[p], SZ); arr_swap(nx, z, k);       # 操作実行
            if ( arr_occur(nx, State, hd) )  continue             # 既出状態
            hd++; State[hd][1] = ""
            arr_copy(State[hd], nx, SZ); up[hd] = p;              # 状態登録
        }
        p++;                                                      # 現節更新
    }
    print "無解";                                                 # 解法失敗
}

##====================================================================
##  目標状態のチェック
##====================================================================

function get_fin(arr) {
    return arr_equ(arr, Goal, SZ)
}

##====================================================================
##  解となる操作列の逆順の出力
##====================================================================

function solution(State, p,    k) {
    k = 0;                        # 手数
    while ( p >= 0 ) {            # 初期状態まで遡及
        printf("%02d : ", k)
        arr_output(State[p], SZ);
        p = up[p]; k++;           # 直前の状態
    }
}


##====================================================================
##  既出状態のチェック
##====================================================================

function arr_occur(arr, State, s) {
    while ( s >= 0 ) {
        if ( arr_equ(arr, State[s], SZ) )  return 1
        s--;
    }
    return 0
}

##====================================================================
##  配列のコピー
##====================================================================

function arr_copy(arr0, arr1, n,    k) {
    for ( k = 1; k <= n; k++ )  arr0[k] = arr1[k]
}

##====================================================================
##  配列の相等
##====================================================================

function arr_equ(arr1, arr2, n,    k) {
    for ( k = 1; k <= n; k++ )  if ( arr1[k] != arr2[k] )  return 0
    return 1
}

##====================================================================
##  配列の出力
##====================================================================

function arr_output(arr, n,    k) {
    for ( k = 1; k <= n; k++ )  printf arr[k]
    print ""
}

##====================================================================
##  配列中の指定位置の要素の交換
##====================================================================

function arr_swap(arr, p1, p2,    t) {
    t = arr[p1]; arr[p1] = arr[p2]; arr[p2] = t;
}

##====================================================================
##  配列中の指定要素の出現位置
##====================================================================

function arr_pos(arr, n, val) {
    for ( k = 1; k <= n; k++ )  if ( arr[k] == val )  return k
}
