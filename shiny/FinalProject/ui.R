#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(tidyverse)

# Define UI for application that draws a histogram
shinyUI(
        dashboardPage(
          
 
  dashboardHeader(title="INFO 536 Final Project-State Migration Effect on 2020 Election"),

     
    dashboardSidebar(
        sidebarMenu(
          menuItem("Introduction", tabName = "Introduction",icon=icon("th")),
          menuItem('Data', tabName="Data", icon=icon("th")),
          menuItem('Methods', tabName="DataModeling", icon=icon("th")),
          menuItem('Results', tabName="Results", icon=icon("th")),
          menuItem('Discussion', tabName="Discussion", icon=icon("th"))
        )
 
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "Introduction",
                h2("Introduction"),
                h3("Does state migration help explain changing Presidential results?"),
                p("The media often classifies states as being as being red, meaning Republican, or blue, 
                  meaning Democrat, by the voting results from that state. It is not known if people
                  based their migration decisions on the results of these elections. Do people who
                  are Democrats avoid going to states with Republicans or vice versa? Or do factors
                  such as economic growth factor greater into the decisions of people? With recent
                  elections having flipped many key states from usually red states to blue states,
                  it is possible that migration might have influenced these outcomes.  
                  This study looks to correlate migration from blue to red states to see
                  if this might factor into the states being flipped in Presidential elections."),
                p("By looking at the map, we can see that 3 of the 5 states that changed sides border at least 2 blue states. Michigan is in the same region as Illinois and is very close. 
                  Let's now look at the migration data. Remember that the migration data is Democratic-Republican, so blue means Democratic migration."),
                plotOutput("explain2"),
                p("Arizona and Pennsylvania show heavy migration from democratic states and switched during the election.
                  This is not surprising because they each border 3 Democratic states in the 2016 election. 
                  However, Georgia has a high level of Republican migration and it changed sides in 2020. 
                  It looks like migration numbers are greatly influenced by proximity. For this study, we look to study these migration effects
                  to see if they explain the 2020 election.")
                ),
        tabItem(tabName = "Data",
                h2("Data"),
                p("The migration data for this study was pulled from the U.S. Census website at",
                a(href="https://www.census.gov/data/tables/time-series/demo/geographic-mobility/state-to-state-migration.html","https://www.census.gov/data/tables/time-series/demo/geographic-mobility/state-to-state-migration.html"),
                "We looked to pull data from the years 2017,2018,2019, and 2020 to evaluate the 
                  results for the 2020 election. However, the 2020 data was not available at the 
                  time of the study. Due to the fact that 2020 was the year of COVID-19, 
                  these seemed acceptable because mobility was greatly constrained 
                  due to the fact of lockdowns due to COVID-19. "),
                p("The election data was pulled from",a(href="https://electionlab.mit.edu/data","https://electionlab.mit.edu/data")," for the U.S. Presidents from 2016-2020. 
                  This data contains the results for each presidential candidate for those years. "),
                p("Some data manipulation was needed to get the data into a format to test our hypothesis.  "),
                p("The migration data needed to be pivoted and condensed into red and blue state migration.
                  We used the year 2016 election to determine the state affiliation. We then summed up 
                  the migration from Democratic states and Republican states into a variable called totalMigration.
                  After this we created a variable named skew which was Democratic votes- Republic votes. 
                  Therefore, a positive skew would mean Democratic migration while a negative value would 
                  mean Republican migration.  We did this for 2016 and 2020, so we had a total skew for both elections.
                  We also created a variable called difference which had a value of “RED-RED,” “RED-BLUE,” or “BLUE-BLUE,” 
                  which describes the state’s group for our analysis. "),
                p("You can see the data listed below in searchable form."),
                dataTableOutput("base_data")
               
        ),
                
                
        tabItem(tabName = "DataModeling",
                h2("Methods"),
                p("The following map is a good visualization of what we are trying to explain. We want to see if we can explain the purple states.
                  However, we want to explain them in a way that we don't get confused on why states didn't switch sides.  "),
                plotOutput("explain"),
                p("We looked to attempt to use linear regression to explain this phenomenon.")
                
                
                
        ),
        tabItem(tabName = "Results",
                h2("Results"),
                h3("First Model"),
                p("I looked at my variable of migration in relation to 2020 skew."),
                verbatimTextOutput ("firstmodel"),
                p("This shows a positive relationship between migration and the 2020 skew. It is significant (p < .01)."),
                p("However, the effect is minuscule with an Adjusted R-squared of 0.009984."),
                h3("Second Model"),
                p("The second model we used compared the 2016 skew and migration to 2020 skew."),
                verbatimTextOutput ("secondmodel"),
                p("In this case, we see that migration has a negative effect, but one of no significance.
                  The previous year's skew is still a highly significant predictor of the next election's skew. It also shows that
                  R-squared is very high at 98%!"),
                p("This leads us to try a third model. We compared the the previous election's skew to the next election skew."),
                h3("Third Model"),
                verbatimTextOutput ("thirdmodel"),
                p("In this model, we see that just the previous election's skew still explains 98% of the data according to the R-squared.")
                ),
        tabItem(tabName = "Discussion",
                h2("Discussion"),
                 p("From the results in this study, we conclude that migration does not have an effect on the changing of states in the 2020 election.
                   We conclude that the biggest factor explained the results for the 2020 election is the 2016 election."),
                plotOutput("linegraph")
                
                )
        
      )
    )
))
