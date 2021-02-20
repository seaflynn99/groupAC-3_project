library(readxl)
library(dplyr)
library(tidyverse)

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
basketball_info$highest_average_nba_freethrow_attempts <- nba_basketball_reference %>%
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

bb_info_table <- table(basketball_info)
bb_info_table <- data.frame(bb_info_table)
renamed_table <- bb_info_table %>%
  rename(
    "Number.of.NBA.Players" = "num_players_nba",
    "Highest.Average.NBA.PPG" = "highest_average_nba_ppg",
    "Highest.Average.NBA.Rebounds" = "highest_average_nba_rebounds",
    "Highest.Average.NBA.Minutes" = "highest_average_nba_mins",
    "Highest.Average.NBA.FTAs" = "highest_average_nba_freethrow_attempts",
    "Number.of.WNBA.Players" = "num_players_wnba",
    "Highest.Average.WNBA.PPG" = "highest_average_wnba_ppg",
    "Highest.Average.WNBA.Rebounds" = "highest_average_wnba_rebounds",
    "Highest.Average.WNBA.Minutes" = "highest_average_wnba_mins",
    "Highest.Average.WNBA.FTAs" = "highest_average_wnba_freethrow_attempts",
  )
grouped_bb_table <- group_by(renamed_table, Number.of.NBA.Players, Number.of.WNBA.Players)
grouped_bb_table <- subset(grouped_bb_table, select = -c(Freq))
