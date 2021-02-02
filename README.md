# The Basketball Domain

As lifelong basketball fans, we all found ourselves pondering - keeping BLM in mind following the events of last year - if the NBA, a longstanding American institution, is truly free of racism - at least in the paycheck department. With just under 75% of the league being made up of Black players, you would expect this to be true. Furthmore, the league's amazing show of force following the spotlight on BLM last year - allowing players to kneel during the national anthem, putting "Black Lives Matter" on the court, players putting BLM messages on jerseys, etc. - suggests that the NBA cares deeply about social justice and ensuring that its players are treated equitably. If there truly _was_ racism present in the league, your average fan would not be able to tell. However, with only 8 out of the league's 30 general managers being Black, one has to wonder if there is any kind of subconscious racism creeping in when it comes time to determine contract values. Obviously, we cannot directly quantify this situation. Would James Harden be making **more** money if he was white? It is impossible to tell, but by performing linear regressions on assorted player statistics - one _with_ race, one _without_ race -  with respect to salary, we can hopefully identify any sort of trend if it does indeed exist.


# Data-driven Questions

- 1. What statistics appear to be the most important in determining salary?
- 2. Does the race of a athlete have any significant effect on pay?
- 3. Which athletes make the _most_ money? Do their stats reflect this?
- 4. Is there any correlation between how many minutes an athlete plays and how much they make?
- 5. Which athletes make the _lowest_ amount of money? Do their stats reflect this?
- 6. Which athlete has - on average - the highest number of rebounds per game?
- 7. Which athlete has - on average - the highest amount of minutes played per game
- 8. What impact does height have on determining salary?


# Examples of Relevant Data Driven Projects

- [Salary amongst major professional sports leagues](https://github.com/NateLeeP/salary_distribution_project) is a project that visually portrays how wealth is distributed using a Lorenz Curve to graphically denote the differences in salary in the 4 American sports leagues (NBA, NFL, MLB, NHL).

- [ETL](https://github.com/vgalst/ETL-Project) calculates and compares salaries for players across 4 American sports leagues (NBA, NFL, MLB, MLS) to contrast between an average players' salary compared to another league's average salary.

- [Salary Based on Race/Gender](https://github.com/ShivRajendran/ggplots--Salary-based-on-Race-Gender) graphically portrays the earnings of people based on race and then on gender, pointing out the discrepancies between the different genders and races.


# Possible Sources of Data

## [basketball-reference.com](https://www.basketball-reference.com/leagues/NBA_2018_per_game.html)

Contains player statistics for the entire 2017-2018 NBA season, including every single player arranged by last name.

- 30 features
- 540 observations
- Collected by Sean Lahman, Chip Hart, Kevin Cohen, and Tom Timmerman
- Relevant to questions 1-7

## [espn.com](http://www.espn.com/nba/salaries)

Contains salary data for every player during the 2017-2018 season, descending. Not directly downloadable, but can easily be compiled into a spreadsheet or CSV.

- 4 features
- 598 observations
- Collected by the ESPN Stats and Information Group
- Relevant to questions 1-5

## [Biometric NBA Dataset](https://www.kaggle.com/justinas/nba-players-data)

Contains even more player statistics - such as height and age - allowing us to view the impact (if any) of inherent traits on a player's salary.

- 22 features
- 11.1k observations
- Collected by Kaggle user Justinas Cirtautus
- Relevant to question 8
