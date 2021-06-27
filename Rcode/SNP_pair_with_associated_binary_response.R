#Description: Simulation of a SNP pair and associated binary response (e.g., disease status) based on "real SNP data".
#consider real SNP1 and SNP2 has 3 genotypes. A 3*3 plot has 9 combinations of genotypes (say, "AA-TT", "AG-AT", etc.), call "cells" and 
#creates a multinomial problem. Finally, the counts in each cell (i.e., counts of each genotype combination of SNP1 & SNP2) is sampled from a Multinomial distribution.
#The binary response (or disease status) is under each genotype combination  is sampled from a Burnouli distribution.

#function to generate true SNP pair starts:

sim_true_snp = function(snp1_name, snp2_name, sam_size, size, geno, prob, prop_y){

                samples = rmultinom(n = sam_size , size = size, prob = prob)
                cell_cat = apply(X = samples, MARGIN = 2, FUN = function(x){which.max(x)} )
                list_final_geno = lapply(cell_cat, FUN = function(x, y){ y[x] } , y =  geno)
                snp1_snp2 = do.call(rbind, Map(rbind, list_final_geno))
                
                dist = as.data.frame(table(snp1_snp2)) #distn of genotype combinations  
                dat = NULL #to store binary response correaponding to 'geno' and bind with 'snp1_snp2'
                
             for(i in 1:length(geno)){
                dat =  rbind(dat, 
                             cbind(rbinom(n = dist$Freq[dist$snp1_snp2 == geno[i]], size = 1, prob = prop_y[i]),
                                   snp1_snp2[snp1_snp2==geno[i]]) )
                  }  
             
                snp1 = sub("-.*", "", dat[,2]) 
                snp2 = sub(".*-", "", dat[,2])
                dat2 = data.frame(as.numeric(as.character(dat[,1])), snp1, snp2) #ensure response = dat[,1] is numerical
                colnames(dat2) = c("response", snp1_name, snp2_name)
                
                #now randomly shuffle the observations in dat2 (optional) 
                n =  dim(dat2)[1]
                final_dat = dat2[sample(1:n, size = n, replace = F), ]
                return(final_dat)
                }
#function ends

#Calling the above "sim_true_snp" function:
#First create a 3*3 plot based on the real SNP pair and real response variable (0/1).
#Obtain counts (and proportions) under each genotype combination.
#Obtain proportion of response variable (i.e., proportion of y=1) under each genotype combination.

set.seed(100)
   
#consider the following:

#genotype combinations (or cells in multinomial distribution):
geno = c("GG-AA", "GG-AG", "GG-GG", "GA-AA", "GA-AG", "GA-GG", "AA-AA", "AA-AG", "AA-GG")  

#sample size in real data
sam_size = 18000 #sample size

#proportion in each genotype combination (or cell probabilities):
prob = c(3641, 3864, 1075, 3242, 3485, 954, 736, 770, 233)/sam_size 

#proportion of y=1 in each cell:
prop_y = c(0.22, 0.22, 0.19, 0.26, 0.22, 0.21, 0.26, 0.21, 0.21)

df = sim_true_snp(snp1_name="SNP1", snp2_name="SNP2", sam_size = sam_size, size=1, geno=geno, prob=prob, prop_y=prop_y)
                  
head(df)
      response SNP1 SNP2
14497        0   GA   AG
5406         0   GG   AG
17952        0   AA   GG
13232        0   GA   AG
405          0   GG   AA
5772         1   GG   AG
