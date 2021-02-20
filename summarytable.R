library(readxl)
library(dplyr)
library(tidyverse)

source("GitHub/groupAC-3_project/summary.R")
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
grouped_bb_table <- subset(renamed_table, select = -c(Freq))
View(grouped_bb_table)
