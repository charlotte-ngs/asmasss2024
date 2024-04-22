


s_inter_path <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_flem.csv"
df_int <- read.table(s_inter_path, header = T, sep = ",")
df_int

# without interactions
lm_bw_bc_hei <- lm(Body.Weight ~ Breast.Circumference + HEI, data = df_int)
summary(lm_bw_bc_hei)

# with interactions
lm_bw_bc_hei_int <- lm(Body.Weight ~ Breast.Circumference * HEI, data = df_int)
summary(lm_bw_bc_hei_int)

# model.matrix
model.matrix(lm_bw_bc_hei_int)


lm_bw_bc_br_int <- lm(Body.Weight ~ Breast.Circumference * Breed, data = df_int)
summary(lm_bw_bc_br_int)