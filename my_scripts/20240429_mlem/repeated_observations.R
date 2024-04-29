#' ---
#' title: Repeated Observations
#' date:  "2024-04-29"
#' ---

# read data to a data frame
s_bw_breed_rep_obs_path <- "https://charlotte-ngs.github.io/asmss2022/data/asm_bw_bc_rep_obs.csv"
df_rep_obs_breed <- read.table(s_bw_breed_rep_obs_path, 
 header = T, sep = ",")
df_rep_obs_breed

# convert animal into a factor
df_rep_obs_breed$Animal <- as.factor(df_rep_obs_breed$Animal)

# plot
library(ggplot2)
p <- ggplot(data = df_rep_obs_breed, 
            mapping = aes(x = Breast.Circumference,
                          y = Body.Weight)) + 
       geom_point(aes(color = Animal, 
                      size = 3))
p
