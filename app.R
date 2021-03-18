library(shiny)
library(plotly)
library(dplyr)
library(tidyverse)
library(readxl)
library(stringr)
library(ggplot2)

bball_merged <- read_excel("nba_merged.xlsx")
finals_ratings <- read_excel("ratings.xlsx")

introduction <- tabPanel("Introduction",
                         mainPanel(img(src= 'basketball.jpg', align = "right"),
                                   p("It is fairly common knowledge that there is a large salary gap between
    men and women in sports. Although there is no clear cut explanation for
    why there is such disparity in pay, we decided to investigate salaries for
    each player in the NBA and each player in the WNBA, their statistical 
    performances in games, and viewership ratings for the NBA Finals compared to 
    the WNBA Finals. We wanted to analyze whether there was a difference in 
    statistical performance to see if that was a potential reason for the 
    salary gap. Viewership ratings for the WNBA Finals are hardly a fraction of
    the viewership ratings for the NBA Finals. It is clear that the NBA Finals
    draws more interest. But, is there really any difference in statistical 
    performance between the two leagues?")
                                   
                         )
)

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
        to the more obvious differences in salary between the NBA and WNBA. There
        don't appear to any blatant examples of Black players on average being paid
        less than white players, but we do still have a clear visual example of 
        athletes in the NBA being paid far more than athletes in the WNBA.")
    )
  )
)

fourth_tab <- tabPanel( #creating page 4
  "Ratings Comparison",
  titlePanel("Chart 3"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("NBA versus WNBA"),
      selectInput("year", #second widget, used for choosing display data
                  label = "Choose a year to display",
                  choices = list("2017",
                                 "2018",
                                 "2019",
                                 "2020")
      ),

    ),
    mainPanel( 
      h1("NBA and WNBA Finals Comparisons"),
      plotlyOutput("ratings_stacked"),
      p("This shows us the vast discrepancy in viewership between the NBA and the 
        WNBA - in particular, during Finals season. As you can see, the WNBA struggles
        to get a fraction of the NBA's viewership, and it is likely due to this 
        vast difference in viewing numbers that we have our ridiculous differences
        in salaries. Does this disparity exists solely due to sexist viewers, or is
        there a deeper, more systemic issue at play?")
    )
  )
)

fifth_tab <- tabPanel( #creating page 5
  "Conclusion",
  titlePanel("Conclusion"),
  
  
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
      in sports because of the customers (i.e., audience). There are not many things the organizations can do to make
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



# Defining the UI
ui <- navbarPage( #piecing the tabs together into singular UI
  "Basketball Exploration",
  introduction,
  second_tab,
  third_tab,
  fourth_tab,
  fifth_tab
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
  
  output$salary_chart <- renderPlotly({
    player_filter <- filter(bball_merged, RCE == input$race, LEAGUE == input$gender) #filtering input
    salary_bar <- ggplotly(ggplot(player_filter) +
      geom_bar(stat="identity", aes(x = Rk, y = SALARY), #plot structure
                ) + 
        #plot labels - title and axes, no need for legend
      ggtitle("Player Salaries by League and Race")
 + labs(x = "Player Number", y = "Player Salary"))
    
    
  })
output$ratings_stacked <- renderPlotly({
  ratings_filter <- filter(finals_ratings, Year == input$year)
  ratings_chart <- ggplotly(ggplot(ratings_filter, aes(x = "", y = Viewership, fill=League)) +
  geom_bar(stat="identity", width = 1))
                              
                            
})
  
}

# Running the app itself
shinyApp(ui = ui, server = server)