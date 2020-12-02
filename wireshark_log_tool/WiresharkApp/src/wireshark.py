# -*- coding: utf-8 -*-
"""
Created on Fri Sep 18 00:10:14 2020

@author: PC
"""

import os
import pandas as pd
import numpy as np
from tqdm import tqdm
import matplotlib.pyplot as plt

import config
import common.logger
#import common.graph2d
#import common.graph3d


def get_log():
    # ネットワークログ取得
    cmd = "tshark -i " + config.wireshark_inerface + " -w " + config.wireshark_pcap_log + " -f \"" + config.wireshark_ip_filter + "\" " + " -f \"" + config.wireshark_port_filter + "\" -a duration:" + config.wireshark_logging_time_sec
#    cmd = "tshark -i 3 -w ../data/wireshark.pcap -f ""  -f "" -a duration:5"
    common.logger.app_logger.info("ネットワークログ取得開始 : " + cmd)
    print(cmd)
#    os.popen(cmd).readline().strip()
    common.logger.app_logger.info("ネットワークログ取得完了")

    # テキストログ変換
    cmd = "tshark -r " + config.wireshark_pcap_log + " > " + config.wireshark_text_log
#    os.popen(cmd).readline().strip()
    common.logger.app_logger.info("テキストログ変換完了 : " + cmd)

    # csvログ変換
    cmd = "tshark -r " + config.wireshark_pcap_log + " -T fields -E header=n -E separator=, -e frame.number -e frame.time_relative -e frame.time_delta -e ip.src -e ip.dst -e _ws.col.Protocol -e data.len -e data.data -e _ws.col.Info > " + config.wireshark_csv_log
#    cmd = "tshark -r " + config.wireshark_pcap_log + " -T fields -E header=y -E separator=, -e frame.number -e frame.time_relative -e frame.time_delta -e ip.src -e ip.dst -e _ws.col.Protocol -e data.len -e data.data -e _ws.col.Info > " + config.wireshark_csv_log
    os.popen(cmd).readline().strip()
    common.logger.app_logger.info("csvログ変換完了 : " + cmd)


# https://qiita.com/f_kazqi/items/0e8e948be44ef2003f71
def preprocessing():
    # 前処理
    # log_org = pd.read_csv(config.wireshark_csv_log, index_col='frame.number')
    log_org = pd.read_csv(config.wireshark_csv_log, index_col='frame.number', header=None, names=['frame.number', 'frame.time_relative', 'frame.time_delta', 'ip.src', 'ip.dst', '_ws.col.Protocol', 'data.len', 'data.data', '_ws.col.Info', 'else'])
    # log_org = pd.read_csv(config.wireshark_csv_log, names=['frame.number', 'frame.time_relative', 'frame.time_delta', 'ip.src', 'ip.dst', '_ws.col.Protocol', 'data.len', 'data.data', '_ws.col.Info', 'else'])
    log = log_org.drop(1, axis=0)  # 1行目は0のため削除
    time_delta = log['frame.time_delta']

    print("総和 : " + str(time_delta.sum()))  # 総和
    print("累積和 : " + str(time_delta.cumsum()))  # 累積和
    print("最小値 : " + str(time_delta.min()))  # 最小値
    print("最大値 : " + str(time_delta.max()))  # 最大値
    print("分散 : " + str(time_delta.var()))  # 分散
    print("	標準偏差 : " + str(time_delta.std()))  # 	標準偏差
    print("	平均絶対偏差 : " + str(time_delta.mad()))  # 	平均絶対偏差
#    print("平均値 : " + str(time_delta.mean()))  # 平均値
#    print("中央値 : " + str(time_delta.median()))  # 中央値
#    print("最頻値 : " + str(time_delta.mode()))  # 最頻値
#    print("範囲 : " + str(time_delta.max() - time_delta.min()))  # 範囲

    summary_df = pd.DataFrame({'time_delta':time_delta})
    deviation = time_delta - time_delta.mean()
    summary_df['偏差'] = deviation
    summary_df['偏差二乗'] = np.square(deviation)
    norm = (time_delta - np.mean(time_delta)) / np.std(time_delta)
    summary_df['正規化'] = norm
    summary_df['偏差値'] = 50 + 10 * norm
    summary_df.to_csv('../data/summary_df.csv')
#    print(summary_df)

    # データ指標要約統計量
    summary = pd.Series(time_delta).describe()
    print(summary)
    # 以下はうまく取り出せない
#    print("count" + str(summary.count))
#    print("mean" + str(summary.mean))
#    print("std" + str(summary.std))
#    print("min" + str(summary.min))
#    print("max" + str(summary.max))
    summary.to_csv('../data/result.csv')
#    count, mean, std, min, max,  = pd.Series(time_delta).describe()
#    print(count)
#    print(mean)
#    print(std)
#    print(min)
#    print(summary.25%)
#    print(summary.50%)
#    print(summary.75%)
#    print(summary.max)
    # 四分位範囲
#    scores_Q1 = np.percentile(log['frame.time_delta'], 25)
#    scores_Q3 = np.percentile(log['frame.time_delta'], 75)
#    scores_IQR = scores_Q3 - scores_Q1
#    print(scores_IQR)

    # histogram---------------------------------------------------------------
    bins = 100
    freq, _ = np.histogram(time_delta, bins=bins, range=(time_delta.min(), time_delta.max()))
    class_value = np.linspace(time_delta.min(), time_delta.max(), bins)
    freq_class = [i for i in range(0, bins, 1)]
    freq_dist_df = pd.DataFrame({'度数':freq}, index=pd.Index(freq_class, name='階級'))
    rel_freq = freq / freq.sum()  # 度数
    cum_rel_freq = np.cumsum(rel_freq)  # 相対度数
    freq_dist_df['階級値'] = class_value
    freq_dist_df['相対度数'] = rel_freq
    freq_dist_df['累積相対度数'] = cum_rel_freq
    freq_dist_df = freq_dist_df[['階級値', '度数', '相対度数', '累積相対度数']]
    freq_dist_df.to_csv('../data/histogram.csv')

    # 可視化(histogram)---------------------------------------------------------------
    fig = plt.figure(figsize=(10, 6))
    ax = fig.add_subplot(111)
    freq, _ , _ = ax.hist(time_delta, bins=bins, range=(time_delta.min(), time_delta.max()))
    ax.set_xlabel('Interval[sec]')
    ax.set_ylabel('Count')
#    ax.set_xticks(np.linspace(time_delta.min(), time_delta.max(), 10+1))
    ax.grid(visible=True)
    plt.show()

    # 可視化(histogram + 折れ線)---------------------------------------------------------------
    fig = plt.figure(figsize=(10, 6))
    ax1 = fig.add_subplot(111)
    ax2 = ax1.twinx()  # Y軸のスケールが違うグラフをax1と同じ領域上に書けるようにする
    # 相対度数のヒストグラムにするためには、度数をデータの数で割る必要がある
    # これはhistの引数weightを指定することで実現できる
    weights = np.ones_like(time_delta) / len(time_delta)
    rel_freq, _, _ = ax1.hist(time_delta, bins=bins, range=(time_delta.min(), time_delta.max()), weights=weights)
    cum_rel_freq = np.cumsum(rel_freq)
    class_value = np.linspace(time_delta.min(), time_delta.max(), bins)
    ax2.plot(class_value, cum_rel_freq, ls='--', marker='o', color='gray')
    ax2.grid(visible=False)  # 折れ線グラフの罫線を消去
    ax1.set_xlabel('Interval[sec]')
    ax1.set_ylabel('Relative frequency')  # 相対度数
    ax2.set_ylabel('Cumulative relative frequency')  # 累積相対度数
    plt.show()
    fig.savefig("../data/histogram.png")

    # 箱ひげ図---------------------------------------------------------------
    fig = plt.figure(figsize=(5, 6))
    ax = fig.add_subplot(111)
    ax.boxplot(time_delta, labels=['Interval[sec]'])
    ax.grid(visible=True)
    plt.show()
    fig.savefig("../data/boxplot.png")


def analysis():
    # 統計処理
    print("統計処理")


def visualization():
    # 統計結果可視化
    print("統計結果可視化")


def error_check():
    # エラーチェック
    log_org = pd.read_csv(config.wireshark_csv_log, index_col='frame.number', header=None, names=['frame.number', 'frame.time_relative', 'frame.time_delta', 'ip.src', 'ip.dst', '_ws.col.Protocol', 'data.len', 'data.data', '_ws.col.Info', 'else'])
    log = log_org.drop(1, axis=0)  # 1行目は0のため削除

    # データ長チェック
    len = log['data.len']
#    for len_ix in len:
#        if len_ix != 3:
#            print(len_ix)

    # 通信周期チェック
    time_delta = log['frame.time_delta']
#    for time_delta_ix in time_delta:
#        if time_delta_ix >= 1.01:
#            print(time_delta_ix)
#        elif time_delta_ix <= 0.9:
#            print(time_delta_ix)

    # 切断チェック
    info = log['_ws.col.Info']
    for info_ix in info:
        if 'RST' in info_ix:
            print(info_ix)