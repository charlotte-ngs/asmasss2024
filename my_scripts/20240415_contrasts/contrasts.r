#' ---
#' title: Contrasts in Linear Models
#' date: 2024-04-15
#' ---

s_bw_br <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_breed.csv"
df_bw_br <- read.table(s_bw_br, header = T, sep=",")
df_bw_br

# contrasts for breed
mat_ctr <- contrasts(as.factor(df_bw_br$Breed))

# assignment of new variable
model.matrix(Body.Weight ~ Breed, df_bw_br)

# understand output of
summary(lm(Body.Weight ~ Breed, df_bw_br))

# extend mat_ctr
mat_ctr_ext <- cbind(matrix(rep(1, nrow(mat_ctr))), mat_ctr)
colnames(mat_ctr_ext)[1] <- "(Intercept)"
mat_ctr_ext

# inverse
mat_ctr_ext_inv <- solve(mat_ctr_ext)
mat_ctr_ext_inv

# group means
n_mean_bw_an <- mean(df_bw_br$Body.Weight[df_bw_br$Breed == "Angus"])
n_mean_bw_li <- mean(df_bw_br$Body.Weight[df_bw_br$Breed == "Limousin"])
n_mean_bw_si <- mean(df_bw_br$Body.Weight[df_bw_br$Breed == "Simmental"])
vec_gr_mean_bw <- c(n_mean_bw_an, n_mean_bw_li, n_mean_bw_si)
vec_gr_mean_bw

# estimates
vec_b_hat <- mat_ctr_ext_inv %*% vec_gr_mean_bw
vec_b_hat


# solutions of least squares normal equations
mat_X <- model.matrix(Body.Weight ~ 0 + Breed, df_bw_br)
mat_X <- cbind(matrix(rep(1, nrow(mat_X))), mat_X)
mat_X
mat_xtx <- crossprod(mat_X)
mat_xtx_ginv <- MASS::ginv(mat_xtx)
mat_xty <- crossprod(mat_X, df_bw_br$Body.Weight)
mat_sol <- crossprod(mat_xtx_ginv, mat_xty)
mat_sol

mat_sol[3] - mat_sol[2]
mat_sol[4] - mat_sol[2]


