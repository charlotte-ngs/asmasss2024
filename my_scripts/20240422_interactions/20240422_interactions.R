#' ---
#' title: Interactions
#' date: 2024-04-22
#' ---
#' 

b_is_online <- TRUE
if (b_is_online){
  s_flem_path <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_flem.csv"
} else {
  s_flem_path <- here::here()("docs", "data", "asm_bw_flem.csv")
}

df_flem <- read.table(s_flem_path, header = T, sep = ",")
df_flem

lm_bw_bc_br <- lm(Body.Weight ~ Breast.Circumference * Breed, data = df_flem)
summary(lm_bw_bc_br)

