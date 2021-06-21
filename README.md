Description: Simulation of a SNP pair and associated binary response (e.g., disease status) based on "real SNP data".
consider real SNP1 and SNP2 has 3 genotypes. A 3 by 3 plot has 9 combinations of genotypes (say, "AA-TT", "AG-AT", etc.), call "cells" and 
creates a multinomial problem. Finally, the counts in each cell (i.e., counts of each genotype combination of SNP1 & SNP2) is sampled from a Multinomial distribution.
The binary response (or disease status) is under each genotype combination  is sampled from a Burnouli distribution.


![image](https://user-images.githubusercontent.com/72481906/122839167-1f41f400-d2bd-11eb-943d-37d6584f3a8c.png)
