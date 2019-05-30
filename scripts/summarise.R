library(dplyr)
df <- read.csv("../csv/outputs/output_draco.csv");
dfk <- df %>% select(version, threads, time) %>% 
     group_by(version, threads) %>%
     summarize(m.time=mean(time), m.time.se=3*sd(time)/sqrt(n())) %>%
     as.data.frame();

dfk
