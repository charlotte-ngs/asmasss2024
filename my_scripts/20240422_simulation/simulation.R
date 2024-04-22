

# data set fomr paper
s_sim_path <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_bc_reg.csv"
df_bw_bc <- read.table(s_sim_path, header = T, sep = ",")
df_bw_bc

# regression
lm_bw_bc <- lm(Body.Weight ~ Breast.Circumference, data = df_bw_bc)
smry_bw_bc <- summary(lm_bw_bc)
smry_bw_bc

# simulate BC
set.seed(2204)
n_nr_obs <- 30
BC_sim <- rnorm(n_nr_obs, 
  mean = mean(df_bw_bc$Breast.Circumference),
sd = sd(df_bw_bc$Breast.Circumference))
summary(BC_sim)

# BW
b_0 <- smry_bw_bc$coefficients["(Intercept)", "Estimate"]
b_1 <- smry_bw_bc$coefficients["Breast.Circumference", "Estimate"]
sd_e <- smry_bw_bc$sigma
BW_sim <- b_0 + b_1 * BC_sim + rnorm(n_nr_obs, mean = 0, sd = sd_e)
summary(BW_sim)

# plot.default(
plot(BC_sim, BW_sim)

# analyse
df_sim <- data.frame(BC.sim = BC_sim, BW.sim = BW_sim)
summary(lm(BW.sim ~ BC.sim, data = df_sim))
