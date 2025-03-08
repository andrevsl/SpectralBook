## Fourier
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle,log,sqrt
import matplotlib.pyplot as plt
from numpy import loadtxt
import skrf as rf


def readCSTTDFiles():
    
    fileL50_I1='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62_I1.txt'
    fileL50_I11='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62_I11.txt'
    fileL50_I21='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62_I21.txt'
    fileL100_I1='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100I1.txt'
    fileL100_I11='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100I11.txt'
    fileL100_I21='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100I21.txt'

    I1= loadtxt(fileL50_I1)
    I11= loadtxt(fileL50_I11)
    I21= loadtxt(fileL50_I21)

    I1L100= loadtxt(fileL100_I1,comments='#')
    I1L100Zp_50=I1L100[:1400]
    I1L100Zp_30=I1L100[1400:1400*2]
    I1L100Zp_100=I1L100[1400*2:]

    I11L100= loadtxt(fileL100_I11,comments='#')
    I11L100Zp_50=I11L100[:1400]
    I11L100Zp_30=I11L100[1400:1400*2]
    I11L100Zp_100=I11L100[1400*2:]

    I21L100= loadtxt(fileL100_I21,comments='#')
    I21L100Zp_50=I21L100[:1400]
    I21L100Zp_30=I21L100[1400:1400*2]
    I21L100Zp_100=I21L100[1400*2:]

    TDL50=dict({'t':I1[:,0],'I1':I1[:,1],'I11':I11[:,1],'I21':I21[:,1]})
    TDL100=dict({'t':I1L100Zp_50[:,0],'I1':I1L100Zp_50[:,1],'I11':I11L100Zp_50[:,1],'I21':I21L100Zp_50[:,1]})
    TDL100Zp30=dict({'t':I1L100Zp_30[:,0],'I1':I1L100Zp_30[:,1],'I11':I11L100Zp_30[:,1],'I21':I21L100Zp_30[:,1]})
    TDL100Zp100=dict({'t':I1L100Zp_100[:,0],'I1':I1L100Zp_100[:,1],'I11':I11L100Zp_100[:,1],'I21':I21L100Zp_100[:,1]})

    return TDL50,TDL100,TDL100Zp30,TDL100Zp100

def readCSTTDFilesZLres():
    
    fileL100ZLres30_I1='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100ZLresistiveI1ZL30.txt'
    fileL100ZLres50_I1='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100ZLresistiveI1ZL50.txt'
    fileL100ZLres100_I1='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100ZLresistiveI1ZL100.txt'
    fileL100ZLres30_I11='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100ZLresistiveI11ZL30.txt'
    fileL100ZLres50_I11='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100ZLresistiveI11ZL50.txt'
    fileL100ZLres100_I11='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineTDw2p62L100ZLresistiveI11ZL100.txt'

    L100ZLres30_I1= loadtxt(fileL100ZLres30_I1,comments='#')
    L100ZLres50_I1= loadtxt(fileL100ZLres50_I1,comments='#')
    L100ZLres100_I1= loadtxt(fileL100ZLres100_I1,comments='#')
    L100ZLres30_I11= loadtxt(fileL100ZLres30_I11,comments='#')
    L100ZLres50_I11= loadtxt(fileL100ZLres50_I11,comments='#')
    L100ZLres100_I11= loadtxt(fileL100ZLres100_I11,comments='#')

    TDL100ZLres50=dict({'t':L100ZLres50_I1[:,0],'I1':L100ZLres50_I1[:,1],'I11':L100ZLres50_I11[:,1],'I21':[]})
    TDL100ZLres30=dict({'t':L100ZLres30_I1[:,0],'I1':L100ZLres30_I1[:,1],'I11':L100ZLres30_I11[:,1],'I21':[]})
    TDL100ZLres100=dict({'t':L100ZLres100_I1[:,0],'I1':L100ZLres100_I1[:,1],'I11':L100ZLres100_I11[:,1],'I21':[]})


    return TDL100ZLres50,TDL100ZLres30,TDL100ZLres100

def readCSTSparZpZLres():
    fileMSL25='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLinew2p62_L25.s2p'
    fileMSL50='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLinew2p62_L50.s2p'

    S_L25_rf = rf.Network(fileMSL25)
    S_L50_rf = rf.Network(fileMSL50)

    fileMSL100Zp30='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineZp1V2_3.s2p'
    fileMSL100Zp50='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineZp1V2_3.s2p'
    fileMSL100Zp100='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLineZp1V2_3.s2p'

    fileMSL100ZLres30='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLinew2p62_ZL_resistive_30.s1p'
    fileMSL100ZLres50='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLinew2p62_ZL_resistive_50.s1p'
    fileMSL100ZLres100='H:\Meu Drive\SocieForParaOPlay\SpectralBook\CSTFiles\MSLinew2p62_ZL_resistive_100.s1p'

    S_L100Zp30_rf = rf.Network(fileMSL100Zp30)
    S_L100Zp50_rf = rf.Network(fileMSL100Zp50)
    S_L100Zp100_rf = rf.Network(fileMSL100Zp100)

    S_L100ZLres30_rf = rf.Network(fileMSL100ZLres30)
    S_L100ZLres50_rf = rf.Network(fileMSL100ZLres50)
    S_L100ZLres100_rf = rf.Network(fileMSL100ZLres100)

    return S_L25_rf,S_L50_rf,S_L100Zp30_rf,S_L100Zp50_rf,S_L100Zp100_rf,S_L100ZLres30_rf,S_L100ZLres50_rf,S_L100ZLres100_rf
