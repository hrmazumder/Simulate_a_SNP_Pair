
 #read the real snp data file (real_snp_data.csv)
 
 library(data.table) #helps importing big data faster
 d = fread("data_directory/real_snp_data.csv")
 
 head(d)
  SNP1 SNP2 response
1   GG   AG        0
2   AA   AG        0
3   AG   AG        0
4   AA   AG        0
5   AG   AG        0
6   GG   AA        0
 
 #make a 3*3 plot to obtain the following-
 #geno: genotype combinations; prob: proportions (or probabilities) under genotype combinations; 
 #prop_y: proportion of response variable equals 1 (i.e., proportion of y=1)
 
 library(SIPI) #to make 3 by 3 plot
 
 x = Grid3by3(d$response, d[, 1:2], c('SNP1', 'SNP2'))
 plot3by3(x, scale = "sliding", freq = T, axis_fs = 1.2, outcome_fs = 0.9, marginal = T)
 
 
