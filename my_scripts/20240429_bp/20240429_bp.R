

s_bp_path <- here::here("data_collections", "20240429_bp_data.xlsx")
tbl_pb <- readxl::read_xlsx(s_bp_path)
tbl_pb


s_rep_path <- "https://charlotte-ngs.github.io/asmasss2024/data/asm_bw_bc_rep_obs.csv"
df_rep_bw_br <- read.table(s_rep_path, header = T, sep = ",")
df_rep_bw_br

# from chatgpt, convert wide to long format
library(tidyr)
data_long <- pivot_longer(
  tbl_pb,
  cols = starts_with("MP"),
  names_to = "MP_Rep",
  values_to = "ManualPulseFreq"
)
print(data_long)
# write to file
s_rep_out_path <- here::here("data_collections", "20240429_bp_data.csv")
readr::write_delim(data_long, s_rep_out_path, delim = ",")

# plot
library(ggplot2)
p_mp <- ggplot(data = data_long,
               mapping = aes(x = ManualPulseFreq,
                             y = SYS)) +
  geom_point(aes(color = MP_Rep))
p_mp

# color based on Nr, shows the structure better
p_nr <- ggplot(data = data_long,
               mapping = aes(x = ManualPulseFreq,
                             y = SYS)) + 
  geom_point(aes(color = as.factor(Nr)))
p_nr


# Repeated observations model
library(lme4)
lmer_bp <- lmer(SYS ~ ManualPulseFreq + (1 | Nr), data = data_long)
summary(lmer_bp)

# ANOVA I  
summary(aov(SYS ~ ManualPulseFreq + as.factor(Nr), data = data_long))

# ANOVA II 
summary(aov(SYS ~ ManualPulseFreq + Error(as.factor(Nr)), data = data_long))
