from MDAnalysis.analysis import rms, align
import matplotlib.pyplot as plt
import matplotlib as mpl
import MDAnalysis as mda
import numpy as np
import pickle
import cycler
import csv
import sys
import pickle as pickle

pwd = '{}/'.format(sys.path[0])

## -----------------------------------------------------------------------------
## Script to compute rmsd with MDAnalysis
## -----------------------------------------------------------------------------
temps = ["298K", "330K","340K", "350K", "360K", "370K"]
replicas = ['0', '1', '2', '3', '4']



for i, temp in enumerate(temps):
    for i, replica in enumerate(replicas):
        try:
            #Adjust these parameters for file names and file types, but this is generic format.
            #All files should be named this way so they are accessible easily 
            trj_path = pwd+"denovo_OPT_"+temp+"_"+replica+".xtc"
            top_path = pwd+"enh_denovo_OPT.gro" 
            ref_path = pwd+'enh_denovo_OPT.gro'

            u = mda.Universe(top_path, trj_path)
            ref = mda.Universe(ref_path)

            R = rms.RMSD(u, ref, select="name CA and resnum 10 to 52").run().results.rmsd.T
            with open('rmsd_denovo_OPT_{}_{}.pkl'.format(temp, replica), 'wb') as f:
                pickle.dump(R, f)
                f.close()
        except OSError:
            print('FILE NOT FOUND OR NOT NAMED PROPERLY')
            continue
        except AttributeError as ae:
            if "_xdr" in str(ae):
                print("Attribute error related to file")
            else:
                print("Other Attribute error")
            continue

