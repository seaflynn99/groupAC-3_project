library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library("gridExtra")

rookie_salaries <- read_excel("GitHub/groupAC-3_project/data/rookie_salaries.xlsx")
nba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/nba_basketball-reference.xlsx")
wnba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/wnba_basketball-reference.xlsx")

points_nba <- ggplot(nba_basketball_reference, aes(x=PTS)) + geom_histogram() +
  ggtitle("NBA Average Points") +
labs(
  x = "Player Points", y = "Salaries (Dollars)")
points_wnba <- ggplot(wnba_basketball_reference, aes(x=PTS)) + geom_histogram() +
  ggtitle("WNBA Average Points") +
  labs(
    x = "Player Points", y = "Salaries (Dollars)")
histopoints <- grid.arrange(points_nba, points_wnba, nrow = 1) 
histopoints
