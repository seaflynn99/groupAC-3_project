library(shiny)
library(plotly)
library(dplyr)
library(tidyverse)
library(readxl)
library(stringr)
library(ggplot2)
library(stringi)

bball_merged <- read_excel("nba_merged.xlsx")

second_tab <- tabPanel( #creating page 2
  "Performance Comparison",
  titlePanel("Chart 1"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("NBA and WNBA
               Player Stats"),
      selectInput("wnba_nba", #second widget, used for choosing display data
                  label = "Choose a league to display",
                  choices = list("NBA",
                                 "WNBA")
                  ),
      selectInput("stat", 
                  label ="Choose a stat to graph",
                  choices = list("Games_Played" = "Games_Played", 
                                 "Minutes_Played" = "Minutes_Played",
                                 "Free_Throws" = "Free_Throws",
                                 "Rebounds" = "Rebounds",
                                 "Assists" = "Assists", 
                                 "Steals" = "Steals", 
                                 "Blocks" = "Blocks")
                  )
    ),
    mainPanel( 
      h1("Player Performances in the WNBA and the NBA"),
      plotlyOutput("stat_chart"),
      p("This chart give us a look not only at player statistics, but the correlation
        that each stat appears to have with player salary - giving us an idea of how
        player performance seemingly affects their total pay.")
    )
  )
)

third_tab <- tabPanel( #creating page 3
  "Salary Comparisons",
  titlePanel("Chart 2"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("NBA versus WNBA"),
      selectInput("gender", #second widget, used for choosing display data
                  label = "Choose a league to display",
                  choices = list("NBA",
                                 "WNBA")
      ),
      selectInput("race", #third widget, choose race of players to graph
                  label ="Choose a race to graph",
                  choices = list("White", "Black")
      )
    ),
    mainPanel( 
      h1("Salaries in the NBA and the WNBA"),
      plotlyOutput("salary_chart"),
      p("The above chart allows us to hone in and identify any obvious
        differences in salary between Black and white-passing players - in addition
        to the more obvious differences in salary between the NBA and WNBA.")
    )
  )
)

fourth_tab <- tabPanel( #creating page 4
  "Viewership",
  titlePanel("Chart 3"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Points scored in the NBA versus WNBA"),
      selectInput("gender", #second widget, used for choosing display data
                  label = "Choose a league to display",
                  choices = list("NBA",
                                 "WNBA")
      ),
      selectInput("race", #third widget, choose race of players to graph
                  label ="Choose a race to graph",
                  choices = list("White", "Black")
      )
    ),
    mainPanel( 
      h1("TV Ratings for the NBA and the WNBA"),
      plotlyOutput("salary_chart"),
      p("The above chart allows us to understand that the difference in salaries may be
        a result of difference in Ratings --> sponsership --> income of the organization.")
    )
  )
)


fifth_tab <- tabPanel( #creating page 5
  "Conclusion",
  titlePanel("Conclusion"),
  
  sidebarLayout(
    
    mainPanel( 
      h1("Takeaways"),
      p("Through this project, we observe that the performance levels for men (NBA) and women (WNBA) are comparable. 
      However, the salaries for players linked to the two organizations have a stark difference. Men make a lot more
      income from their job (playing) with the NBA than women make for their job with the WNBA. But does this necessarily 
      mean that women are being discriminated against in the sports world? From the 3rd chart we can see that the viewership 
      and ratings are significantly higher for the NBA compared to the WNBA. Therefore, the NBA gets better sponsorships
      and can afford to pay their players higher salaries than the WNBA. Thus, we can conclude that there is no 
      statistically significant discrimination against women from their organization. However, the societal
      conditioning and sexism makes men's games more interesting to the viewers. This means that sexism prevails
      in sports because of the "customers" i.e., audience. There are not many things the organizations can do to make
      women's sports more appealing to the audience. Hopefully, things will change, and people will willingly watch a
      sport regardless of the players' genders."),
      p("To highlight the takeaways:
          1.	1.	NBA and WNBA players perform similar statistically.  
          2.	NBA players get paid significantly more than WNBA players.
          3.	NBA has a higher viewership than WNBA, and thus has a greater income."),
      p("Food for thought: 
        Are the ratings different because sports is considered male entertainment? Men like games better when men are playing?")
    )
  )
)


# Defining the UI
ui <- navbarPage( #piecing the tabs together into singular UI
  "Basketball Exploration",
  second_tab,
  third_tab
)

# Defining the server
server <- function(input, output) { 

  output$stat_chart <- renderPlotly({
    stat_filter <- filter(bball_merged, LEAGUE == input$wnba_nba)
    stats_scatter <- ggplotly(ggplot(stat_filter, aes_string(x = input$stat, y = "SALARY")) +
      geom_point() + geom_smooth() +
      ggtitle("Player Performances By League")
  + labs(x = "Selected Player Statistic", y = "Player Salary"))
    
  })
  
  #establishing output for page 2 - the carbon visualization
  output$salary_chart <- renderPlotly({
    player_filter <- filter(bball_merged, RCE == input$race, LEAGUE == input$gender) #filtering input
    salary_bar <- ggplotly(ggplot(player_filter) +
      geom_bar(stat="identity", aes(x = Rk, y = SALARY), #plot structure
                ) + 
        #plot labels - title and axes, no need for legend
      ggtitle("Player Salaries by League and Race")
 + labs(x = "Player Number", y = "Player Salary"))
    
    
  })
  
}

# Running the app itself
shinyApp(ui = ui, server = server)