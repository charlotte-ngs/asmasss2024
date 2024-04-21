# define dataset

n_nr_rec_est_fun <- 6
df_est_fun <- data.frame(Animal = c(1:n_nr_rec_est_fun),
                         Breed  = c(rep("Angus", 3), 
                           "Limousin", rep("Simmental", 2)),
                        Observation = c(16, 10, 19, 27, 11, 13))
df_est_fun

# number of observations
n_nr_obs <- nrow(df_est_fun)

# design matrix X using model.matrix
mat_X <- model.matrix(Observation ~ 0 + Breed, df_est_fun)
mat_X <- cbind(matrix(data = rep(1, n_nr_obs), ncol = 1), mat_X)
colnames(mat_X)[1] <- "Intercept"
mat_X

# vector of observations
vec_y <- df_est_fun$Observation
vec_y

# normal equations
mat_xtx <- crossprod(mat_X)
mat_xty <- crossprod(mat_X, vec_y)
mat_xtx_ginv <- MASS::ginv(mat_xtx) # matrix G
mat_sol <- crossprod(mat_xtx_ginv, mat_xty)
mat_sol

# check
crossprod(mat_xtx, mat_sol) - mat_xty


# other solutions
vec_z <- rep(1,4)
vec_z <- c(100, 200, -60, -3)

vec_z

vec_b_tilde0 <- mat_sol + (crossprod(mat_xtx_ginv, mat_xtx) - diag(nrow = 4)) %*% vec_z
vec_b_tilde0
crossprod(mat_xtx, vec_b_tilde0) - mat_xty


vec_b_tilde1 <- c(14, 1, 13, -2)
vec_b_tilde4 <- c(1519.5, -1504.5, -1492.5, -1507.5)

#crossprod(mat_xtx, vec_b_tilde1) - mat_xty
#crossprod(mat_xtx, vec_b_tilde4) - mat_xty


# functions alpha_1 - alpha_2
mat_sol[2,1] - mat_sol[3,1]
vec_b_tilde1[2] - vec_b_tilde1[3]
vec_b_tilde4[2] - vec_b_tilde4[3]

# mu + alpha_1
mat_sol[1,1] + mat_sol[2,1]
vec_b_tilde1[2] + vec_b_tilde1[1]
vec_b_tilde4[2] + vec_b_tilde4[1]

# our interest is in result of 
lm_obs_breed <- lm(Observation ~ Breed, df_est_fun)
summary(lm_obs_breed)

# functions alpha2 - alpha_1
mat_sol[3,1] - mat_sol[2,1]
vec_b_tilde1[3] - vec_b_tilde1[2]
vec_b_tilde4[3] - vec_b_tilde4[2]

# functions alpha3 - alpha_1
mat_sol[4,1] - mat_sol[2,1]
vec_b_tilde1[4] - vec_b_tilde1[2]
vec_b_tilde4[4] - vec_b_tilde4[2]
