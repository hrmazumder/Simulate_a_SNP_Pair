
#Simulate a pair of SNPs and associated response (0/1) based on real SNP data 50 times.
#Note: such simulation is necessary when a researcher is interested in calculating true positive rate in the SNP study.  

source("Simulate_a_SNP_Pair/Rcode/SNP_pair_with_associated_binary_response.R")

set.seed(100)

no_rep = 50
sample_size = 18000 
geno = c("GG-AA", "GG-AG", "GG-GG", "GA-AA", "GA-AG", "GA-GG", "AA-AA", "AA-AG", "AA-GG")  
prob = c(3641, 3864, 1075, 3242, 3485, 954, 736, 770, 233)/sample_size 
prop_y = c(0.22, 0.22, 0.19, 0.26, 0.22, 0.21, 0.26, 0.21, 0.21)

df_list = replicate(n=no_rep, sim_true_snp( snp1_name = "SNP1", snp2_name = "SNP2", sam_size = sample_size,
                                             geno=geno, prob=prob, prop_y=prop_y), simplify = FALSE )

df_final <- do.call(cbind, Map(cbind, df_list))

#now make each simulation distinct by concatenating index (1:50) with the simulated snp names and responses
idx = rep(1:no_rep, each=3)
colnames(df_final) = paste( rep(colnames(df_final)[1:3], times = no_rep), idx, sep="_")

dim(df_final)
[1] 18000     150
