#' ---
#' title: Verify Least Squares Regression
#' date: 2024-03-04 
#' ---

s_bw_bc_url_csv <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_bc_reg.csv"
df_bw_bc_csv <- read.table(s_bw_bc_url_csv, header = TRUE, sep = ",")
df_bw_bc_csv

N <- nrow(df_bw_bc_csv)
x_dot_bar <- mean(df_bw_bc_csv[,"Breast.Circumference"])

