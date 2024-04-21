

y = c(16, 10, 19, 27, 11, 13)
X = matrix(c(1, 1, 0, 0,
             1, 1, 0, 0,
             1, 1, 0, 0,
             1, 0, 1, 0,
             1, 0, 0, 1,
             1, 0, 0, 1), nrow=length(y), byrow =T)
X

xtx <- crossprod(X)
xty <- crossprod(X, y)

xtx_ginv <- MASS::ginv(xtx)

b_0 <- crossprod(xtx_ginv, xty)
b_0

# check
crossprod(xtx, b_0) - xty

# alternative solutions
n_nr_sol <- length(b_0)
vec_z <- rep(1, n_nr_sol)
vec_z

b_1 <- b_0 + (xtx_ginv %*% xtx - diag(nrow = n_nr_sol)) %*% vec_z
b_1