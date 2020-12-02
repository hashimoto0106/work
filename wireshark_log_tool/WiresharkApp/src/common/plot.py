# -*- coding: utf-8 -*-
"""
Created on Sat Jul 28 21:15:26 2018

@author: hashimoto
"""

import matplotlib.pylab as plt
import matplotlib.pyplot as matplt
from mpl_toolkits.mplot3d import Axes3D


def show_2D_grahp(title, x, y, xlabel, ylabel, xmin, xmax, ymin, ymax, arg):
    """
    2次元グラフ表示

    Parameters
    ----------
    title : グラフタイトル
    x : x軸データ
    y : y軸データ
    xlabel : x軸ラベル
    ylabel : y軸ラベル
    xmin : x軸最小値
    xmax : x軸最大値
    ymin : y軸最小値
    ymax : y軸最大値

    Returns
    -------
    - : -
    """
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)

    if xmin != xmax:
        plt.xlim(xmin, xmax)

    if ymin != ymax:
        plt.ylim(ymin, ymax)

    plt.grid()
    plt.plot(x, y, arg)
    plt.show()


def show_3D_grahp(title, x, y, z, xlabel, ylabel, zlabel, legend, xmin, xmax, ymin, ymax, zmin, zmax, arg):
    """
    3次元グラフ表示

    Parameters
    ----------
    title : グラフタイトル
    x : x軸データ
    y : y軸データ
    z : y軸データ
    xlabel : x軸ラベル
    ylabel : y軸ラベル
    zlabel : y軸ラベル
    xmin : x軸最小値
    xmax : x軸最大値
    ymin : y軸最小値
    ymax : y軸最大値
    zmin : z軸最小値
    zmax : z軸最大値

    Returns
    -------
    - : -
    """

    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')

    plt.title(title)

    if xmin != xmax:
        plt.xlim(xmin, xmax)

    if ymin != ymax:
        plt.ylim(ymin, ymax)

    if zmin != zmax:
        plt.ylim(zmin, zmax)

    ax.scatter(x, y, z,
               s=20,  # マーカー大きさ
               c='r',  # マーカー色
               alpha=0.3,  # マーカー透明度(0-1)
               linewidths=2,  # マーカー枠線幅
               marker='^',  # マーカー形
               label=legend)  # 凡例名

    ax.legend()
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_zlabel(zlabel)
    plt.show()


def show_histgram(title, data, bins):
    """
    ヒストグラム表示

    Parameters
    ----------
    title : グラフタイトル
    data : データ
    bins : 階級数

    Returns
    -------
    - : -
    """
    matplt.title(title)
    matplt.grid()

    matplt.hist(
                data,  # ヒストグラムを作成するための生データの配列
                bins,  # ビン (表示する棒) の数。階級数。(デフォルト値: 10)
                range=None,  # ビンの最小値と最大値を指定。(デフォルト値: (x.min(), x.max()))
                normed=False,  # True に設定すると正規化 (合計値が 1 になるように変換)。 (デフォルト値: False)
                weights=None,  # 
                cumulative=False,  # True に設定すると、累積ヒストグラムを出力。 (デフォルト値: False)
                bottom=None,  # 各棒の下側の余白を数値または配列で指定
                histtype='bar',  # ‘bar’ (通常のヒストグラム), ‘barstacked’ (積み上げヒストグラム), ‘step’ (線), ‘stepfilled ‘ (塗りつぶしありの線) から選択。 (デフォルト値: ‘bar’)
                align='mid',  # 各棒の中心を X 軸目盛上のどの横位置で出力するか。 ‘left’, ‘mid’, ‘right’ から選択。(デフォルト値: ‘mid’)
                orientation='vertical',  # 棒の方向。’horizontal’ (水平方向), ‘vertical’ (垂直方向) から選択。(デフォルト値: ‘vertical’)
                rwidth=None,  # 各棒の幅を数値または、配列で指定
                log=False,  # True に設定すると、縦軸を対数目盛で表示
                color=None,  # ヒストグラムの色。配列で指定し、データセット単位で色を指定
                label=None,  # 凡例
                stacked=False,  # True に設定すると積み上げヒストグラムで出力します。False に設定すると、横に並べて出力
                hold=None,  # 
                data=None  # 
                )

    matplt.show()


def show_2D_vector(title, X, Y, U, V, xlabel, ylabel, xmin, xmax, ymin, ymax):
    """
    2Dベクトル

    Parameters
    ----------
    title : グラフタイトル
    X : ベクトル始点X
    Y : ベクトル始点Y
    U : ベクトル）成分X
    V : ベクトル）成分Y
    xlabel : x軸ラベル
    ylabel : y軸ラベル
    xmin : x軸最小値
    xmax : x軸最大値
    ymin : y軸最小値
    ymax : y軸最大値

    Returns
    -------
    - : -
    """
    matplt.figure()

    matplt.quiver(U, V, angles='xy', scale_units='xy', scale=1)

    # グラフ描画
    matplt.title(title)
    matplt.xlabel(xlabel)
    matplt.ylabel(ylabel)

    if xmin != xmax:
        plt.xlim(xmin, xmax)

    if ymin != ymax:
        plt.ylim(ymin, ymax)

    matplt.grid()
    matplt.draw()
    matplt.show()


def show_3D_vector(title, X, Y, Z, U, V, W, xlabel, ylabel, zlabel, xmin, xmax, ymin, ymax, zmin, zmax):
    """
    3Dベクトル

    Parameters
    ----------
    title : グラフタイトル
    X : ベクトル始点X
    Y : ベクトル始点Y
    Z : ベクトル始点Z
    U : ベクトル終点X
    V : ベクトル終点Y
    W : ベクトル終点W
    xlabel : x軸ラベル
    ylabel : y軸ラベル
    zlabel : z軸ラベル
    xmin : x軸最小値
    xmax : x軸最大値
    zmin : z軸最小値
    ymax : y軸最大値
    zmin : z軸最小値
    zmax : z軸最大値

    Returns
    -------
    - : -
    """
    fig = matplt.figure()
    ax = fig.gca(projection='3d')
    ax.set_aspect("equal")

    matplt.quiver(X, Y, Z,
                  U, V, W,
                  length=1.0,
                  arrow_length_ratio=0.3)

    # グラフ描画
    matplt.title(title)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_zlabel(zlabel)

    if xmin != xmax:
        plt.xlim(xmin, xmax)

    if ymin != ymax:
        plt.ylim(ymin, ymax)

    if zmin != zmax:
        plt.zlim(zmin, zmax)

    matplt.grid()
    matplt.draw()
    matplt.show()
