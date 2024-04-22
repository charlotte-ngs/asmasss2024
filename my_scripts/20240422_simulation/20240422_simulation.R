

s_bw_bc_url <- "/Users/pvr/Data/Projects/Github/charlotte-ngs/asmss2024_proj-root/website/asmasss2024/docs/data/asm_bw_bc_reg.csv"
df_bw_bc <- read.table(s_bw_bc_url, header = T, sep = ",")
df_bw_bc

lm_bw_bc <- lm(Body.Weight ~ Breast.Circumference, data = df_bw_bc)
smry_bw_bc <- summary(lm_bw_bc)
b_0 <- smry_bw_bc$coefficients["(Intercept)", "Estimate"]
b_1 <- smry_bw_bc$coefficients["Breast.Circumference", "Estimate"]
sd_e <- smry_bw_bc$sigma

n_nr_sim_obs <- 30
X_sim <- rnorm(n_nr_sim_obs, 
               mean = mean(df_bw_bc$Breast.Circumference), 
               sd = sd(df_bw_bc$Breast.Circumference))
Y_sim <- b_0 + b_1 * X_sim + rnorm(n_nr_sim_obs, mean = 0, sd = sd_e)

