import pandas as pd
import numpy as np




class SimuParam():

    def __init__(self):
        self.emconst=pd.DataFrame( {"e0": [8.854223e-12],   #Permissividade absoluta do meio Free space
                        "er": [2.2],   #Permissividade relativa do meio, primeira casa meio 1
                        "ereff": [2.2],   #Permissividade efetiva do meio 
                        "u0": [1.256640e-6],      #Permeabilidade absoluta do meio Free space
                        "ur": [1],   # Permeabilidade relativa do meio 1, primeira casa meio 1
                        "eta0": [np.sqrt(1.256640e-6/8.854223e-12)],   # Impedancia de Onda Free space
                        "sig": [0],   # Condutividade do meio 1, primeira casa meio 1
                        "cc": 1/np.sqrt(1.256640e-6*8.854223e-12),   # Light Velocity
                        
                      } 
            )
        self.par=pd.DataFrame( {"Name": ['HSinP'], 
                                    "t0": [0], # time stamp start
                                    "tf": [0], # time stamp end
                                    "x0": [0], # x start point
                                    "xf": [0],  # x end point
                                    "y0": [0], # y start point
                                    "yf": [0],  # y end point
                                    "z0": [0], # z start point
                                    "zf": [0],  # z end point                        
                                    'f':[0],  # Frequency
                                    'Lamb':[0],  # Frequency                        
                                    'kx':[0], # Prapagation constant of x-direction 
                                    'Fx':[0], # Sampling Spatial Frequency of x-direction 
                                    'ky':[0], # Prapagation constant of y-direction 
                                    'Fy':[0], # Sampling Spatial Frequency of y-direction 
                                    'kz':[0], # Prapagation constant of z-direction 
                                    'Fz':[0], # Sampling Spatial Frequency of z-direction                          
                                    "Nt": [0],  # Time points
                                    "dt": [0], # Time Discretization delta
                                    "Nt": [0],  # Number of Time points
                                    "dx": [0], #  x Discretization delta
                                    "dy": [0], #  y Discretization delta
                                    "dz": [0], #  z Discretization delta
                                    "Fs": [0], # Sampling Freq Hz
                                    "Nfft": [0]} ## FFT Points (ODD Number)
                                )
        self.par.set_index("Name",inplace=True)
        self.set_HsinP(40*1e9)
        self.set_HSinN(40*1e9)
        self.set_Gau(40*1e9)
    def set_HsinP(self,Fs):
       
        self.par.loc['HSinP','f']=1e9 # Frequency
        self.par.loc['HSinP','Fs']= Fs#20*self.par.loc['HSinP','f'] # Sampling Frequency
        self.par.loc['HSinP','dt']=1/self.par.loc['HSinP','Fs']# Time Delta
              
        self.par.loc['HSinP','t0']=0 # Sampling Frequency
        self.par.loc['HSinP','tf']=5e-9 # Sampling Frequency
        self.par.loc['HSinP','Nt']=int(len(np.arange(self.par.loc['HSinP','t0'],self.par.loc['HSinP','tf'],self.par.loc['HSinP','dt']))) # x space Points (odd)

        self.par.loc['HSinP','Lamb']=1/np.sqrt(self.emconst['e0'][0]*self.emconst['u0'][0])/self.par.loc['HSinP','f']# Frequency
        self.par.loc['HSinP','kx']=2*np.pi/self.par.loc['HSinP','Lamb'] # Frequency
        self.par.loc['HSinP','dx']= self.par.loc['HSinP','Lamb']/20 # x Delta
        self.par.loc['HSinP','Fx']= 1/self.par.loc['HSinP','dx']

        self.par.loc['HSinP','x0']=-3*self.par.loc['HSinP','Lamb'] # Sampling Frequency
        self.par.loc['HSinP','xf']=3*self.par.loc['HSinP','Lamb'] # Sampling Frequency
        self.par.loc['HSinP','Nx']=int(len(np.arange(self.par.loc['HSinP','x0'],self.par.loc['HSinP','xf'],self.par.loc['HSinP','dx']))) # x space Points (odd)

    def set_HSinN(self,Fs):
        self.par.loc['HSinN','f']=1e9 # Frequency
        self.par.loc['HSinN','Fs']=Fs #20*self.par.loc['HSinN','f'] # Sampling Frequency
        self.par.loc['HSinN','dt']=1/self.par.loc['HSinN','Fs']# Time Delta
              
        self.par.loc['HSinN','t0']=0 # Sampling Frequency
        self.par.loc['HSinN','tf']=5e-9 # Sampling Frequency
        self.par.loc['HSinN','Nt']=int(len(np.arange(self.par.loc['HSinN','t0'],self.par.loc['HSinN','tf'],self.par.loc['HSinN','dt']))) # x space Points (odd)

        self.par.loc['HSinN','Lamb']=1/np.sqrt(self.emconst['e0'][0]*self.emconst['u0'][0])/self.par.loc['HSinN','f']# Frequency
        self.par.loc['HSinN','kx']=2*np.pi/self.par.loc['HSinN','Lamb'] # Frequency
        self.par.loc['HSinN','dx']= self.par.loc['HSinN','Lamb']/20 # x Delta
        self.par.loc['HSinN','Fx']= 1/self.par.loc['HSinN','dx']

        self.par.loc['HSinN','x0']=-3*self.par.loc['HSinN','Lamb'] # Sampling Frequency
        self.par.loc['HSinN','xf']=3*self.par.loc['HSinN','Lamb'] # Sampling Frequency
        self.par.loc['HSinN','Nx']=int(len(np.arange(self.par.loc['HSinN','x0'],self.par.loc['HSinN','xf'],self.par.loc['HSinN','dx'])))# x space Points (odd)        

    def set_Gau(self,Fs):
        self.par.loc['Gau','f']=1e9 # Frequency
        self.par.loc['Gau','Fs']=Fs #20*self.par.loc['Gau','f'] # Sampling Frequency
        self.par.loc['Gau','dt']=1/self.par.loc['Gau','Fs']# Time Delta
              
        self.par.loc['Gau','t0']=0 # Sampling Frequency
        self.par.loc['Gau','tf']=5e-9 # Sampling Frequency
        self.par.loc['Gau','Nt']=int(len(np.arange(self.par.loc['Gau','t0'],self.par.loc['Gau','tf'],self.par.loc['Gau','dt']))) # x space Points (odd)

        self.par.loc['Gau','Lamb']=1/np.sqrt(self.emconst['e0'][0]*self.emconst['u0'][0])/self.par.loc['Gau','f']# Frequency
        self.par.loc['Gau','kx']=2*np.pi/self.par.loc['Gau','Lamb'] # Frequency
        self.par.loc['Gau','dx']= self.par.loc['Gau','Lamb']/20 # x Delta
        self.par.loc['Gau','Fx']= 1/self.par.loc['Gau','dx']

        self.par.loc['Gau','x0']=-3*self.par.loc['Gau','Lamb'] # Sampling Frequency
        self.par.loc['Gau','xf']=3*self.par.loc['Gau','Lamb'] # Sampling Frequency
        self.par.loc['Gau','Nx']=int(len(np.arange(self.par.loc['Gau','x0'],self.par.loc['Gau','xf'],self.par.loc['Gau','dx'])))# x space Points (odd)        
    
    def set_TD_CST(self,Name,t,I1,I11,I21):
        self.par.loc[Name,'f']=1e9 # Frequency
        self.par.loc[Name,'dt']=(t[1]-t[0])*1e-9# Time Delta
        self.par.loc[Name,'Fs']=1/self.par.loc[Name,'dt'] #20*self.par.loc[Name,'f'] # Sampling Frequency

        self.par.loc[Name,'t0']=t.min()*1e-9 # Sampling Frequency
        self.par.loc[Name,'tf']=t.max()*1e-9 # Sampling Frequency
        self.par.loc[Name,'Nt']=len(t) # x space Points (odd)


        # self.par.loc[Name,'Lamb']=1/np.sqrt(self.emconst['e0'][0]*self.emconst['u0'][0])/self.par.loc[Name,'f']# Frequency
        # self.par.loc[Name,'kx']=2*np.pi/self.par.loc[Name,'Lamb'] # Frequency
        # self.par.loc[Name,'dx']= self.par.loc[Name,'Lamb']/20 # x Delta
        # self.par.loc[Name,'Fx']= 1/self.par.loc[Name,'dx']

        # self.par.loc[Name,'x0']=-3*self.par.loc[Name,'Lamb'] # Sampling Frequency
        # self.par.loc[Name,'xf']=3*self.par.loc[Name,'Lamb'] # Sampling Frequency
        # self.par.loc[Name,'Nx']=int(len(np.arange(self.par.loc[Name,'x0'],self.par.loc[Name,'xf'],self.par.loc[Name,'dx'])))# x space Points (odd)

    def set_empar(self,id,er,ur,sig):
        self.emconst['er'][0]=er
        self.emconst['ur'][0]=ur
        self.emconst['sig'][0]=sig
        

        
