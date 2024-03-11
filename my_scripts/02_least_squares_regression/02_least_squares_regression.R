#' ---
#' title: Validation of Least Squares Regression
#' date: 2024-03-04 
#' ---

# read beef cattle data
s_bw_bc_url <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_bc_reg.csv"
df_bw_bc <- read.table(s_bw_bc_url, header = T, sep = ",")
df_bw_bc


# Computations for slope estimate
x <- df_bw_bc$Breast.Circumference
y <- df_bw_bc$Body.Weight
N <- nrow(df_bw_bc)

x_y_dot <- sum(x*y)
x_dot_bar <- mean(x)
y_dot_bar <- mean(y)
x_sq_dot <- sum(x*x)
b_1_hat <- (x_y_dot - N * x_dot_bar * y_dot_bar) / (x_sq_dot - N * x_dot_bar^2)
b_1_hat


# Compuations for intercept
b_0_hat <- y_dot_bar - b_1_hat * x_dot_bar
b_0_hat


# Validation
lm_bw_bc <- lm(Body.Weight ~ Breast.Circumference, data = df_bw_bc)
summary(lm_bw_bc)

