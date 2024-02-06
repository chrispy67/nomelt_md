## This repository contains necessary information to reproduce the molecular dynamics simulations presented in this paper.

This work is the MD portion associated with _A learnable transition from low temperature to high temperature proteins with neural machine translation_ TODO LINK

- All simulations were performed using GROMACS 2022.5 compiled on The University of Washington Hyak computer cluster. 
- The structures provided are solvated and energy-minimized.
- Generic `.mdp` files used to simulate all replicas for every protein.
- `rmsd.py` is an example script that calculates the RMSD of an ensemble of protein structures at different temperatures
- `rmsd_pkls.zip` contains pickle files of rmsd values calcualted for all simulations
- `MD-figs.ipynb` is the notebook used to read the pkl files and create the MD figure in the manuscript.
