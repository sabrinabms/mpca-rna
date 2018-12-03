#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 21 11:04:46 2018

@author: sabrinabms

Rotina para normalizar dados que serao usados pela RNA
Deve-se especificar o intervalo de normalizacao:
    novoMaior
    novoMenor
E alterar o nome do arquivo de entrada e saida
"""

import numpy as np


path = '/Users/sabrinabms/Documents/DoutoradoOrganizado/Onda2D/Fortran/mpcaANNv0.982/data/'
novoMaior = 1
novoMenor = 0

x = np.loadtxt(path+'entrada_observada.dat', delimiter=' ')

antigoMenor = x.min()
antigoMaior = x.max()

xNormalizado = ((x - antigoMenor)*(novoMaior - novoMenor)/
                antigoMaior-antigoMenor) - novoMenor
#xNormalizado = ((4.06454000 - antigoMenor)*(novoMaior - novoMenor)/
#                antigoMaior-antigoMenor) - novoMenor
                
np.savetxt(path+'entrada_observada_normalizada.dat', xNormalizado, delimiter=' ', 
           fmt = '%13.8f' )