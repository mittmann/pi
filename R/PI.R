df <- read_csv("") %>%
select(-metric, -machine) -> df

df %>%
group_by(app, threads) %>%
summarise(mean = mean(value),
sd = sd(value),
N = n()) %>%
arrange(app, threads) -> df
