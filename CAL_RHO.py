# -*- coding: utf-8 -*-
"""
Created on Thu Sep  6 21:18:57 2018

@author: hashimoto
"""
# https://qiita.com/damyarou/items/9cb633e844c78307134a
from math import radians
from math import atan
from math import acos
from math import sin
from math import cos
from math import tan


def CAL_PHI(ra, rb, lat):
    return atan(rb/ra*tan(lat))


def CAL_RHO(PosnA, PosnB):
    ra=6378.140  # equatorial radius (km)
    rb=6356.755  # polar radius (km)
    F=(ra-rb)/ra # flattening of the earth
    rad_lat_A=radians(PosnA[0])
    rad_lon_A=radians(PosnA[1])
    rad_lat_B=radians(PosnB[0])
    rad_lon_B=radians(PosnB[1])
    pA=CAL_PHI(ra,rb,rad_lat_A)
    pB=CAL_PHI(ra,rb,rad_lat_B)
    xx=acos(sin(pA)*sin(pB)+cos(pA)*cos(pB)*cos(rad_lon_A-rad_lon_B))
    c1=(sin(xx)-xx)*(sin(pA)+sin(pB))**2/cos(xx/2)**2
    c2=(sin(xx)+xx)*(sin(pA)-sin(pB))**2/sin(xx/2)**2
    dr=F/8*(c1-c2)
    rho=ra*(xx+dr)
    return rho


#def CAL_RHO(Lat_A,Lon_A,Lat_B,Lon_B):
#    ra=6378.140  # equatorial radius (km)
#    rb=6356.755  # polar radius (km)
#    F=(ra-rb)/ra # flattening of the earth
#    rad_lat_A=radians(Lat_A)
#    rad_lon_A=radians(Lon_A)
#    rad_lat_B=radians(Lat_B)
#    rad_lon_B=radians(Lon_B)
#    pA=CAL_PHI(ra,rb,rad_lat_A)
#    pB=CAL_PHI(ra,rb,rad_lat_B)
#    xx=acos(sin(pA)*sin(pB)+cos(pA)*cos(pB)*cos(rad_lon_A-rad_lon_B))
#    c1=(sin(xx)-xx)*(sin(pA)+sin(pB))**2/cos(xx/2)**2
#    c2=(sin(xx)+xx)*(sin(pA)-sin(pB))**2/sin(xx/2)**2
#    dr=F/8*(c1-c2)
#    rho=ra*(xx+dr)
#    return rho

#for iii in (0,1,2):
#    if iii==0:
#        Lat_A= 3.117; Lon_A=101.550; loc_A='Kuala Lumpur'
#        Lat_B=35.690; Lon_B=139.760; loc_B='Tokyo'
#    if iii==1:
#        Lat_A= 3.117; Lon_A=101.550; loc_A='Kuala Lumpur'
#        Lat_B=-6.183; Lon_B=106.833; loc_B='Jakarta'
#    if iii==2:
#        Lat_A= 34.7211538; Lon_A=135.3617240; loc_A='甲子園'
#        Lat_B= 34.654381; Lon_B=134.993635; loc_B='兵庫県立明石公園第一野球場'
#
#    rho=CAL_RHO(Lat_A,Lon_A,Lat_B,Lon_B)
#    print('(Lat_A, Lon_A)=({0:8.3f},{1:8.3f}): {2:16s}'.format(Lat_A,Lon_A,loc_A))
#    print('(Lat_B, Lon_B)=({0:8.3f},{1:8.3f}): {2:16s}'.format(Lat_B,Lon_B,loc_B))
#    print('Distance={0:10.3f} km'.format(rho))
#    print()
