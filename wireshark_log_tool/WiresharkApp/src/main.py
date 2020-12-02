# -*- coding: utf-8 -*-
"""
Created on Thu Apr 23 22:18:02 2020

@author:sample
"""

import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))

import time
from tqdm import tqdm
from datetime import datetime
import numpy as np

import config
import common.logger
import common.database
# import common.rsyslog
# import common.syslog
#import common.console
#import common.line

import version
import wireshark
#import help
#import parameter
#import translation


if __name__ == "__main__":

    common.logger.app_logger.info('Application Ver.%s Start', version.get_version())
    now = datetime.now()
    start_time = time.time()

    # database.create_table()  # テーブル生成
    common.logger.logging_environment()  # 実行環境ログ
    config.logging_paramter()  # Parameter読み込み

    wireshark.get_log()  # ログ取得
#    wireshark.preprocessing()  # 前処理
#    wireshark.analysis()  # 統計解析
#    wireshark.visualization()  # 統計解析結果可視化
    wireshark.error_check()  # エラーチェック

    # line.send_message("Application End")
    proc_time = (time.time()-start_time)
    common.database.insert(now, proc_time)  # データベース追加
    common.logger.app_logger.info('Application End(%.6lf[sec])', proc_time)
