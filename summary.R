library(readxl)
library(dplyr)
nba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/nba_basketball-reference.xlsx")
View(nba_basketball_reference)
wnba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/wnba_basketball-reference.xlsx")
View(wnba_basketball_reference)

basketball_info <- list()
basketball_info$num_players_nba <- nrow(nba_basketball_reference)
basketball_info$highest_average_nba_ppg <- nba_basketball_reference %>%
  filter(PTS == max(PTS, na.rm = T)) %>%
  select(PTS)
basketball_info$highest_average_nba_rebounds <- nba_basketball_reference %>%
  filter(TRB == max(TRB, na.rm = T)) %>%
  select(TRB)
basketball_info$highest_average_nba_mins <- nba_basketball_reference %>%
  filter(MP == max(MP, na.rm = T)) %>%
  select(MP)
basketball_info$highest_average_freethrow_attempts <- nba_basketball_reference %>%
  filter(FTA == max(FTA, na.rm = T)) %>%
  select(FTA)
basketball_info$num_players_wnba <- nrow(wnba_basketball_reference)
basketball_info$highest_average_wnba_ppg <- wnba_basketball_reference %>%
  filter(PTS == max(PTS, na.rm = T)) %>%
  select(PTS)
basketball_info$highest_average_wnba_rebounds <- wnba_basketball_reference %>%
  filter(TRB == max(TRB, na.rm = T)) %>%
  select(TRB)
basketball_info$highest_average_wnba_mins <- wnba_basketball_reference %>%
  filter(MP == max(MP, na.rm = T)) %>%
  select(MP)
basketball_info$highest_average_wnba_freethrow_attempts <- wnba_basketball_reference %>%
  filter(FTA == max(FTA, na.rm = T)) %>%
  select(FTA)

