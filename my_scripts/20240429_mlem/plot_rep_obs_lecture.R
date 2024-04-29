

s_rep_path <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_bc_rep_obs.csv"
df_rep_bw_br <- read.table(s_rep_path, header = T, sep = ",")
df_rep_bw_br

class(df_rep_bw_br$Animal)
df_rep_bw_br$Animal <- as.factor(df_rep_bw_br$Animal)
class(df_rep_bw_br$Animal)

# plot
library(ggplot2)
p <- ggplot(data = df_rep_bw_br, 
           mapping = aes(x = Breast.Circumference,
                         y = Body.Weight)) + 
  geom_point(aes(color = Animal))
p

# lm of bw on bc, does not show the grouping 
lm_bw_bc <- lm(Body.Weight ~ Breast.Circumference, data = df_rep_bw_br)
summary(lm_bw_bc)
# see grouping in residuals plot
plot(lm_bw_bc)