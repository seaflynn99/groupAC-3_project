library(readxl)
library(dplyr)
library(tidyverse)

nba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/nba_basketball-reference.xlsx")
wnba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/wnba_basketball-reference.xlsx")

nba_tibble <- group_by(nba_basketball_reference, G) %>%
  summarize_at(c("PTS", "TRB"), mean, na.rm = TRUE) %>%
  round(digits = 3) %>%
  rename(Games_Played = G, Average_Points = PTS, Average_Rebounds = TRB)

wnba_tibble <- group_by(wnba_basketball_reference, G) %>%
  summarize_at(c("PTS", "TRB"), mean, na.rm = TRUE) %>%
  round(digits = 3) %>%
  rename(Games_Played = G, Average_Points = PTS, Average_Rebounds = TRB)
