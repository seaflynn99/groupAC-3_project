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