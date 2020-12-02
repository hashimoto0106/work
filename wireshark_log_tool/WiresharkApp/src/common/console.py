# -*- coding: utf-8 -*-
"""
Created on Sat May 23 22:07:38 2020

@author: PC
"""

# from fabric.colors import green
import colorama
from colorama import Fore, Back, Style

colorama.init()

class Color:
    BLACK     = '\033[30m'
    RED       = '\033[31m'
    GREEN     = '\033[32m'
    YELLOW    = '\033[33m'
    BLUE      = '\033[34m'
    PURPLE    = '\033[35m'
    CYAN      = '\033[36m'
    WHITE     = '\033[37m'
    END       = '\033[0m'
    BOLD      = '\038[1m'
    UNDERLINE = '\033[4m'
    ACCENT = '\033[01m'  # 強調
    FLASH = '\033[05m'  # 点滅
    INVISIBLE = '\033[08m'
    REVERCE   = '\033[07m'  # 反転
    RED_FLASH = '\033[05;41m' #赤背景+点滅

#print(Color.BLACK + "BLACK" + Color.END)
#print(Color.RED + "RED" + Color.END)
#print(Color.GREEN + "GREEN" + Color.END)
#print(Color.YELLOW + "YELLOW" + Color.END)
#print(Color.BLUE + "BLUE" + Color.END)
#print(Color.PURPLE + "PURPLE" + Color.END)
#print(Color.CYAN + "CYAN" + Color.END)
#print(Color.WHITE + "WHITE" + Color.END)
#print(Color.END + "END" + Color.END)
#print(Color.BOLD + "BOLD" + Color.END)
#print(Color.UNDERLINE + "UNDERLINE" + Color.END)
#print(Color.ACCENT + "ACCENT" + Color.END)
#print(Color.FLASH + "FLASH" + Color.END)
#print(Color.RED_FLASH + "RED_FLASH" + Color.END)
#print(Color.INVISIBLE + "INVISIBLE" + Color.END)
#print(Color.REVERCE + "REVERCE" + Color.END)
#
## 色
#for attr in dir(Fore):
#    if attr[0] != '_':
#        print(getattr(Fore, attr) + "### Fore.{:<15}".format(attr) + Back.WHITE + "### Fore.{:<15}".format(attr))
#        print(getattr(Back, attr) + "### Back.{:<15}".format(attr) + Fore.BLACK + "### Back.{:<15}".format(attr))
#
## スタイル
#for attr in dir(Style):
#    if attr[0] != '_':
#        print(getattr(Style, attr) + "### Style.{:<10} ###".format(attr))
