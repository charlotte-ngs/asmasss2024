

s_rep_obs_path <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_bc_rep_obs.csv"
df_rep_obs <- read.table(s_rep_obs_path, header = T, sep = ",")
df_rep_obs
lm_bw_bc <- lm(Body.Weight ~ Breast.Circumference, data = df_rep_obs)
summary(lm_bw_bc)
sum((fitted(lm_bw_bc)-mean(df_rep_obs$Body.Weight))^2)
sum((df_rep_obs$Body.Weight - fitted(lm_bw_bc))^2)
summary(aov(Body.Weight ~ Breast.Circumference, data = df_rep_obs))


s_bw_breed_rep_obs_path <- "https://charlotte-ngs.github.io/asmss2022/data/asm_bw_breed_rep_obs.csv"
df_bw_breed_rep <- read.table(s_bw_breed_rep_obs_path, header = T, sep = ",")
df_bw_breed_rep