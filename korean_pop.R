library(readxl)
library(tidyverse)

df <- read_excel("~/Documents/korea population.xlsx")
df

df$pop <- parse_number(df$`Estimated Population`)

df$pop[8] <- df$pop[8]/1000000
df$pop[9] <- df$pop[9]/1000000
df$pop[10] <- df$pop[10]/1000000

df$pop <- df$pop*1e6
df

df$name <- paste(df$Surname, df$`Korean (Hanja)`)

library(scales)

df %>% 
  ggplot(aes(pop, reorder(name, pop))) +
  geom_point() +
  theme_minimal() +
  scale_x_continuous(labels = label_number(scale = 1e-6, suffix = "M")) +
  theme(text = element_text(family = "Apple SD Gothic Neo"))


df %>% 
  ggplot(aes(pop, reorder(name, pop))) +
  geom_point() +
  theme_minimal() +
  scale_x_continuous(labels = label_number(scale = 1e-6, suffix = "M"), trans = 'log10') +
  theme(text = element_text(family = "Apple SD Gothic Neo"))
