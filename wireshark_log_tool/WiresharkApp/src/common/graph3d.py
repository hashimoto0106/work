# -*- coding: utf-8 -*-
"""
Created on Sat Sep  5 15:30:37 2020

@author: PC
"""

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np

# graphクラス
class graph(object):

    def __init__(self, title, xlabel, ylabel, zlabel, xrange, yrange, zrange, grid):
        """
        Constructor

        Parameters
        ----------
        title : string
            Graph Title
        xlabel : string
            X Axis Label
        ylabel : string
            Y Axis Label
        xrange : int
            X Axis Minimum - Maximum
        yrange : int
            Y Axis Minimum - Maximum
        grid : bool
            Grid Enable
            
        Returns
        ----------
        None
        """
        self.fig = plt.figure(figsize = (6, 6))  # FigureとAxes
        self.axes = self.fig.add_subplot(111, projection='3d')  # 3Dグラフ1つ
        self.axes = Axes3D(self.fig)
        self.axes.set_title(title)
        self.axes.set_xlabel(xlabel, fontsize = 11)
        self.axes.set_ylabel(ylabel, fontsize = 11)
        self.axes.set_zlabel(zlabel, fontsize = 11)
        if xrange[0] != xrange[1]:
            self.axes.set_xlim(xrange[0], xrange[1])
#            self.axes.axis(xmin = xrange[0], xmax = xrange[1])
        if yrange[0] != yrange[1]:
            self.axes.set_ylim(yrange[0], yrange[1])
#            self.axes.axis(ymin = yrange[0], ymax = yrange[1])
        if zrange[0] != zrange[1]:
            self.axes.set_zlim(zrange[0], zrange[1])
##            self.axes.axis(zmin = zrange[0], zmax = zrange[1])
        if grid == True:
            self.axes.grid()


    def set_coodinate(self, org, x_axis, y_axis, z_axis):
        """
        座標設定

        Parameters
        ----------
        org : float[3]
            原点座標
        x_axis : float[3]
            X軸
        y_axis : float[3]
            Y軸
        z_axis : float[3]
            Z軸
        Returns
        ----------
        text : string
            (X, Y, Z)形式テキスト
        """
        self.axes.quiver(org[0], org[1], org[2], x_axis[0], x_axis[1], x_axis[2], color = "black", length = 1, arrow_length_ratio = 0.2)
        self.axes.quiver(org[0], org[1], org[2], y_axis[0], y_axis[1], y_axis[2], color = "black", length = 1, arrow_length_ratio = 0.2)
        self.axes.quiver(org[0], org[1], org[2], z_axis[0], z_axis[1], z_axis[2], color = "black", length = 1, arrow_length_ratio = 0.2)
        self.axes.legend()  # 凡例
        self.axes.text(x_axis[0], x_axis[1], x_axis[2], "X", color = "black", size = 9)  # X座標表示
        self.axes.text(y_axis[0], y_axis[1], y_axis[2], "Y", color = "black", size = 9)  # Y座標表示
        self.axes.text(z_axis[0], z_axis[1], z_axis[2], "Z", color = "black", size = 9)  # Z座標表示

        
    def text_value(self, p):
        """
        (X, Y, Z)形式テキスト変換
        
        Parameters
        ----------
        p : float[3]
            3次元座標
            
        Returns
        ----------
        text : string
            (X, Y, Z)形式テキスト
        """
        text = "(" + str(p[0]) + ", " + str(p[1]) + ", " + str(p[2]) + ")"
        return text


    def plot_vector(self, label, p0, p1, color = "black"):
        """
        ベクトル描画
        
        Parameters
        ----------
        label : string
            凡例
        p0 : float[3]
            3次元座標　始点
        p1 : float[3]
            3次元座標　終点
        color : string
            色
            
        Returns
        ----------
        None
        """
        self.axes.quiver(p0[0], p0[1], p0[2], p1[0], p1[1], p1[2], color = color, length = 1, arrow_length_ratio = 0.2, label=label)
        self.axes.legend()  # 凡例
        self.axes.text(p1[0], p1[1], p1[2], self.text_value(p1), color = color, size = 9)  # 数値表示


    def plot_point(self, label, p, marker=".", color = "black"):
        """
        ポイント描画
        
        Parameters
        ----------
        label : string
            凡例
        p : float[3]
            3次元座標
        marker : string
            マーカー
        color : string
            色
            
        Returns
        ----------
        None
        """
        self.axes.scatter(p[0], p[1], p[2], marker=marker, color=color, label=label)  # プロット
        self.axes.legend()  # 凡例
        self.axes.text(p[0], p[1], p[2], self.text_value(p), color = color, size = 9)  # 数値表示



    def plot_sphere(self, org, r, color = "black"):
        """
        球描画
        
        Parameters
        ----------
        org : float[3]
            球原点3次元座標
        r : float
            球半径
        color : string
            色
            
        Returns
        ----------
        None
        """
        theta_1_0 = np.linspace(0, 2*np.pi, 100) # θ_1は[0,π/2]の値をとる
        theta_2_0 = np.linspace(0, 2*np.pi, 100) # θ_2は[0,π/2]の値をとる
        theta_1, theta_2 = np.meshgrid(theta_1_0, theta_2_0) # ２次元配列に変換
        x = org[0] + (np.cos(theta_2)*np.sin(theta_1) * r) # xの極座標表示
        y = org[1] + (np.sin(theta_2)*np.sin(theta_1) * r) # yの極座標表示
        z = org[2] + (np.cos(theta_1) * r) # zの極座標表示
        self.axes.plot_surface(x, y, z, alpha=0.2, color = color) # 球を３次元空間に表示
