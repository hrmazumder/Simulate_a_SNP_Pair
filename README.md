**Simulation of a SNP pair and associated binary outcome (e.g., disease status) based on real SNP data**

A SNP is a single nucleotide base pair difference in the DNA sequence of an individual member of a species.

At first let us look at an example of SNP data with a pair of SNPs (_SNP1_ & _SNP2_) and associated binary outcome variable (_y_) below.
```
 Outcome SNP1 SNP2
        1   GA   AG
        1   GG   AG
        0   GA   AA
        
        .    .    .
        .    .    .
        .    .    .
        1   GG   AA
        1   GA   AG
        1   GG   GG
```

Consider a pair of real SNPs, namely _SNP1_ and _SNP2_; each SNP has 3 genotypes. A 3 by 3 plot reveals 9 combinations of genotypes (say, "_AA-GG_", "_AA-GA_", etc.), call "cells". The counts in the cells creates a Multinomial distribution. Now, let's make a 3 by 3 plot for the given real SNP data (available at- Simulate_a_SNP_Pair/Data/real_snp_data.csv).

<p align="center">
  <img width="400" height="300" src="https://github.com/hrmazumder/Simulate_a_SNP_Pair/blob/main/Data/3%20by%203%20plot%20of%20SNP1%20vs%20SNP2.png">
</p>

The above plot shows the counts in each cell, the proportion of _y=1_ in the cell and the marginal estimates of these components. For example, the count corresponding to genotype combination GG-AA is 3641 and the proporiton of y=1 is 0.22. The marginal estimates are shown in the total. For the further clarification, the count 3641 means _GG-AA_, genotype _GG_ in _SNP1_ and genotype _AA_ in _SNP2_, is present 3641 times in the given SNP data. 

To generate data for a pair of SNPs, the counts for each genotype combination (or cells) are sampled from a Multinomial distribution. The binary outcome variable assiciated with each genotype combination is sampled from a Burnouli distribution. The proportion of _y=1_ in the cells have been used as the success probabilities. 

Finally, a simulated data set contains the genotypes for SNP1 and SNP2 and the binary outcome associated with each genotype combination.


The code to make a 3 by 3 plot is available in the directory- Simulate_a_SNP_Pair/Rcode/read_data_and_make_3*3_plot.R

In addition to simulating one data, the code for generating multiple simulated SNP data sets is available in the directory- Simulate_a_SNP_Pair/Rcode/simulate_50_pairs_SNPs_&_associated_response.R





