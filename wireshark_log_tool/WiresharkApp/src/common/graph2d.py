# -*- coding: utf-8 -*-
"""
Created on Sat Sep  5 12:49:39 2020

@author: PC
"""

import math
import scipy
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

# graphクラス
class graph(object):

    def __init__(self, title, grid, polar=False):
        """
        Constructor
        Parameters
        ----------
        title : string
            Graph Title
        grid : bool
            Grid Enable
        """
        self.fig = plt.figure(figsize = (6, 6))  # FigureとAxes
        self.axes = self.fig.add_subplot(111, polar=polar)  # 2Dグラフ1つ
        self.axes.set_title(title)
        if grid == True:
            self.axes.grid(True)


    # グラフ設定
    def set_graph(self, xlabel, ylabel, xrange, yrange):
        """
        Graph Class
        Parameters
        ----------
        xlabel : string
            X Axis Label
        ylabel : string
            Y Axis Label
        xrange : int
            X Axis Minimum - Maximum
        yrange : int
            Y Axis Minimum - Maximum
        """
        self.axes.set_xlabel(xlabel, fontsize = 11)
        self.axes.set_ylabel(ylabel, fontsize = 11)
        if xrange[0] != xrange[1]:
            plt.xlim(xrange[0], xrange[1])
        if yrange[0] != yrange[1]:
            plt.ylim(yrange[0], yrange[1])


    # 画像グラフ設定
    def set_graph_image(self, width, height):
        self.axes.set_xlabel("Width[px]", fontsize = 11)
        self.axes.set_ylabel("Height[px]", fontsize = 11)
        self.axes.set_xlim(0, width)
        self.axes.set_ylim(height, 0)


    # 画像グラフ設定
    def set_graph_polar(self, rmax):
        self.axes.set_rmax(rmax)

    # ポイント描画
    def plot_point_polar(self, label, theta, rad, marker=".", color = "black"):
        self.axes.scatter(theta, rad, marker=marker, color=color, label=label)  # プロット
        self.axes.legend()  # 凡例
#        self.axes.text(theta, rad, self.text_value(p), color = color, size = 9)  # 数値表示


    # ベクトル描画
    def text_value(self, p):
        return "(" + str(p[0]) + ", " + str(p[1]) + ")"


    # ベクトル描画
    def plot_vector(self, label, p0, p1, color = "black"):
        self.axes.quiver(p0[0], p0[1], p1[0], p1[1], color = color, angles = 'xy', scale_units = 'xy', scale = 1, label=label)
        self.axes.legend()  # 凡例
        self.axes.text(p1[0], p1[1], self.text_value(p1), color = color, size = 9)  # 数値表示


    # ポイント描画
    def plot_point(self, label, p, marker=".", color = "black"):
        self.axes.plot(p[0], p[1], marker=marker, markersize=10, color=color, label=label)  # プロット
        self.axes.legend()  # 凡例
        self.axes.text(p[0], p[1], self.text_value(p), color = color, size = 9)  # 数値表示


    # 円描画
    def plot_circle(self, p, r, color = "black"):
        c = patches.Circle(xy=(p[0], p[1]), radius=r, fc=color, ec=color)
        self.axes.add_patch(c)
#        self.axes.set_aspect('equal')


    # 矩形描画
    def plot_rectangle(self, p, width, height, color = "black"):
        r = patches.Rectangle(xy=(p[0], p[1]), width=width, height=height, ec='#000000', fill=False)
        self.axes.add_patch(r)
#        self.axes.set_aspect('equal')

    def ellipse(self, x, a, b):
        y = b * np.sqrt(1 - (np.power(x, 2) / np.power(a, 2)))
        return y


    # 楕円描画
    # 楕円描画
    def plot_ellipse_test2(self, label, p, a, b, color = "black"):
        t = np.linspace(-1 * np.pi, np.pi, 100) # －π～πまでの範囲
        phase = np.pi / 2                       # 位相
        x = a * np.sin(t - phase)               # 1周期分の正弦波を作成
        g = np.gradient(x)                      # xの勾配を計算
        
        # 第1象限から第4象限までの全てのy値を計算
        y = []
        for i in range(len(g)):
            y = np.append(y, self.ellipse(x[i], a, b))
            if i == 0:
                pass
            elif np.sign(g[i-1]) == np.sign(g[i]):
                pass
            else:
                y = -1 * y
        self.axes.plot(x+p[0], y+p[1], color=color, label=label)  # プロット


# 楕円描画
    def plot_ellipse(self, label, p, a, b, rot, color = "black"):
        t = np.linspace(0, 2*math.pi, 100)
        Ell = np.array([a*np.cos(t) , b*np.sin(t)])  
        t_rot = math.radians(rot) #rotation angle
        R_rot = np.array([[math.cos(t_rot) , -math.sin(t_rot)],[math.sin(t_rot) , math.cos(t_rot)]])  #2-D rotation matrix
             
        Ell_rot = np.zeros((2,Ell.shape[1]))
        for i in range(Ell.shape[1]):
            Ell_rot[:,i] = np.dot(R_rot,Ell[:,i])
#        plt.plot( Ell[0,:] , Ell[1,:],'darkorange' )     #initial ellipse
        plt.plot( p[0]+Ell_rot[0,:] , p[1]+Ell_rot[1,:] , color = color)    #rotated ellipse


    # 楕円描画
    def plot_ellipse_test(self, p, width, height, color = "black"):
        r = patches.Ellipse(xy=(p[0], p[1]), width=width, height=height, ec='#000000', fill=False)
        self.axes.add_patch(r)


  # 2次元ガウス分布描画
    def multivariate_normal(self, mean, cov):
        rate = 2.0
        x,y = np.meshgrid(np.linspace(-cov[0][0]*rate,cov[0][0]*rate, 1000),np.linspace(-cov[1][1]*rate, cov[1][1]*rate, 1000))
        pos = np.dstack((x,y))
        z = scipy.stats.multivariate_normal(mean,cov).pdf(pos)
        self.axes.contourf(x,y,z)
        self.axes.set_xlim(-cov[0][0]*rate, cov[0][0]*rate)
        self.axes.set_ylim(-cov[1][1]*rate, cov[1][1]*rate)
        self.axes.set_xlabel('x')
        self.axes.set_ylabel('y')
        self.axes.set_aspect('equal')
