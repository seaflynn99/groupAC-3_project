library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library("gridExtra")

rookie_salaries <- read_excel("GitHub/groupAC-3_project/data/rookie_salaries.xlsx")
nba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/nba_basketball-reference.xlsx")
wnba_basketball_reference <- read_excel("GitHub/groupAC-3_project/data/wnba_basketball-reference.xlsx")

rebounds_nba <- ggplot(data = nba_basketball_reference) +
  geom_point(mapping = aes(x = TRB, y = MP)) +
  ggtitle("NBA Average Rebounds")
rebounds_wnba <- ggplot(data = wnba_basketball_reference) +
  geom_point(mapping = aes(x = TRB, y = MP)) +
  ggtitle("WNBA Average Rebounds")
scatterbounds <- grid.arrange(rebounds_nba, rebounds_wnba, nrow = 1) 
scatterbounds
