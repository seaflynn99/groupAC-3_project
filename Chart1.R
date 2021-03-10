library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(gridExtra)

rookie_salaries <- read_excel("GitHub/groupAC-3_project/data/rookie_salaries.xlsx")
nba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/nba_basketball-reference.xlsx")
wnba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/wnba_basketball-reference.xlsx")

rook_sal_nba <- ggplot(data = rookie_salaries, aes(x= Player, y= NBA_Salaries)) +
  geom_bar(stat="identity") +
  ggtitle("NBA Top Draft Pick Salaries") +
  labs(
    x = "Pick Number", y = "Salaries (Dollars)")
rook_sal_wnba <- ggplot(data= rookie_salaries, aes(x= Player, y= WNBA_Salaries)) +
  geom_bar(stat="identity") +
  ggtitle("WNBA Top Draft Pick Salaries")+
  labs(
    x = "Pick Number", y = "Salaries (Dollars)")
barsalaries <- grid.arrange(rook_sal_nba, rook_sal_wnba)
barsalaries

