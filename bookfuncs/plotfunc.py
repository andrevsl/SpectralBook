## Fourier
import numpy as np
from numpy import sin, exp, cos, log10, pi,angle
import matplotlib.pyplot as plt

# Nfft=1025
def S1d(y,Nfft,Fs):
    yf={'S':[],'f':[]}
    yf['S']=np.fft.fftshift(np.fft.fft(y,Nfft))
    yf['f']=Fs/2*np.linspace(-1,1,Nfft)
    return yf
#yf=S1d(y,Nfft,Fs)

def plot1DS(ax,f,xl,*args):
      # fig,ax=plt.subplots(2,2)
      # fig.set_size_inches((10,10))
      for ii in range(len(args)):
        ax[ii,0].plot(f/1e9,abs(args[ii]))
        ax[ii,0].set_xlabel("Freq (GHz) ")
        ax[ii,0].set_ylabel(" Amplitude ")
        ax[ii,0].set_xlim([-xl,xl])

        ax[ii,1].plot(f,180/pi*np.angle(args[ii]))
        ax[ii,1].set_xlabel(" Freq (GHz) ")
        ax[ii,1].set_ylabel(" Phase (Deg) ")
        ax[ii,1].set_xlim([-xl,xl])

def plot2DSparametricMag(ax,f,xl,*args):
      for ii,jj,arg,col,lstyle in args:
        ax[ii,jj].plot(f/1e9,(abs(arg)),color=col,linestyle=lstyle)
        ax[ii,jj].set_xlabel("Freq (GHz) ")
        ax[ii,jj].set_ylabel("Amplitude  (dB) ")
        ax[ii,jj].set_xlim(xl)

def plot2DSparametricMagdB(ax,f,xl,*args):
      for ii,jj,arg,col,lstyle in args:
        ax[ii,jj].plot(f/1e9,20*log10(abs(arg)),color=col,linestyle=lstyle)
        ax[ii,jj].set_xlabel("Freq (GHz) ")
        ax[ii,jj].set_ylabel("Amplitude  (dB) ")
        ax[ii,jj].set_xlim(xl)

def plot2DSparametricPhase(ax,f,xl,*args):
      for ii,jj,arg,col,lstyle in args:
        ax[ii,jj].plot(f/1e9,180/pi*np.angle(arg),color=col,linestyle=lstyle)
        ax[ii,jj].set_xlabel(" Freq (GHz) ")
        ax[ii,jj].set_ylabel(" Phase (Deg) ")
        ax[ii,jj].set_xlim(xl)

def plot2DTparametric(ax,t,*args):
      
      for ii,jj,xl,yl,arg,title,col,lstyle in args:
        ax[ii,jj].set_title(title)
        ax[ii,jj].plot(t/1e-9,arg,color=col,linestyle=lstyle)
        ax[ii,jj].set_xlabel("Time (ns) ")
        ax[ii,jj].set_ylabel(" Amplitude")
        ax[ii,jj].set_ylim(yl)
        ax[ii,jj].set_xlim(xl)

def plot1DTparametric(ax,t,*args):
      # fig,ax=plt.subplots(2,2)
      # fig.set_size_inches((10,10))
    #   print(ax)
      for ii,xl,yl,arg,title,col,lstyle in args:
        print(title)
    
        ax[ii].set_title(title)
        ax[ii].plot(t/1e-9,arg,color=col)
        ax[ii].set_xlabel("Time (ns) ")
        ax[ii].set_ylabel("Amplitude")
        ax[ii].set_ylim(yl)
        ax[ii].set_xlim(xl)
     
def plot1DSparametric(ax,f,xl,*args):
      # fig,ax=plt.subplots(2,2)
      # fig.set_size_inches((10,10))
      for ii,arg,col,lstyle in args:
        # print(f.shape)
        # print(arg.shape)
        ax[ii].plot(f/1e9,abs(arg),color=col,linestyle=lstyle)
        ax[ii].set_xlabel("Freq (GHz) ")
        ax[ii].set_ylabel(" Amplitude ")
        ax[ii].set_xlim([-xl,xl])

        ax[ii+1].plot(f/1e9,180/pi*np.angle(arg),color=col,linestyle=lstyle)
        ax[ii+1].set_xlabel(" Freq (GHz) ")
        ax[ii+1].set_ylabel("Phase (Deg) ")
        ax[ii+1].set_xlim([-xl,xl])

def plot1DSparametricUwrap(ax,f,xl,*args):
      # fig,ax=plt.subplots(2,2)
      # fig.set_size_inches((10,10))
      for ii,arg in args:
        # print(f.shape)
        # print(arg.shape)
        ax[ii].plot(f/1e9,abs(arg))
        ax[ii].set_xlabel("Freq (GHz) ")
        ax[ii].set_ylabel(" Amplitude ")
        ax[ii].set_xlim([-xl,xl])

        ax[ii+1].plot(f/1e9,180/pi*np.unwrap(np.angle(arg)))
        ax[ii+1].set_xlabel(" Freq (GHz) ")
        ax[ii+1].set_ylabel("Phase (Deg) ")
        ax[ii+1].set_xlim([-xl,xl])       

#.append(plt.text(x[i], y[i], 'Something'+str(i)))
# adjust_text(ts, x=x, y=y, force_points=0.1, arrowprops=dict(arrowstyle='->',
# color='red'))
#ax[0,0].annotate('Something', xy=(yf['f'][ix], yf['S'][ix]),arrowprops=dict(arrowstyle='->', color='red'))