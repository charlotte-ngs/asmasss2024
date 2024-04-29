s_bw_breed_rep_obs_path <- "https://charlotte-ngs.github.io/asmss2022/data/asm_bw_breed_rep_obs.csv"
df_rep_obs_breed <- read.table(s_bw_breed_rep_obs_path, 
 header = T, sep = ",")
df_rep_obs_breed

aov_bw_breed <- aov(Body.Weight ~ Breed, 
                           data = df_rep_obs_breed)
summary(aov_bw_breed)

aov_bw_breed_animal <- aov(Body.Weight ~ Breed + Animal, 
                           data = df_rep_obs_breed)
summary(aov_bw_breed_animal)

aov_bw_no_breed_rep <- aov(Body.Weight ~ Error(Animal), 
                           data = df_rep_obs_breed)
summary(aov_bw_no_breed_rep)

aov_bw_breed_rep <- aov(Body.Weight ~ Breed + 
                             Error(Animal), 
                           data = df_rep_obs_breed)
summary(aov_bw_breed_rep)

lme_bw_no_breed_rep <- lme4::lmer(Body.Weight ~ 
                                    (1|Animal), 
                       data = df_rep_obs_breed)
summary(lme_bw_no_breed_rep)

