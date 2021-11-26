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
          menuItem('Data Modeling', tabName="DataModeling", icon=icon("th")),
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
                  if this might factor into the states being flipped in Presidential elections.")
                ),
        tabItem(tabName = "Data",
                h2("Data"),
                p("The migration data for this study was pulled from the U.S. Census website at",
                a(href="https://www.census.gov/data/tables/time-series/demo/geographic-mobility/state-to-state-migration.html","https://www.census.gov/data/tables/time-series/demo/geographic-mobility/state-to-state-migration.html"),
                p("We looked to pull data from the years 2017,2018,2019, and 2020 to evaluate the 
                  results for the 2020 election. However, the 2020 data was not available at the 
                  time of the study. Due to the fact that 2020 was the year of COVID-19, 
                  these seemed acceptable because mobility was greatly constrained 
                  due to the fact of lockdowns due to COVID-19. ")),
                p("The election data was pulled from",a(href="https://electionlab.mit.edu/data","https://electionlab.mit.edu/data")," for the U.S. Presidents from 2016-2020. 
                  This data contains the results for each presidential candidate for those years. "),
                p("There was some data manipulation that was needed to get the data into a format to test our hypothesis. "),
                
                dataTableOutput("base_data"),
                
                "Data"),
        tabItem(tabName = "DataModeling",
                h2("Data Modeling"),
                "Data Modeling"),
        tabItem(tabName = "Results",
                h2("Results"),
                "Results"),
        tabItem(tabName = "Discussion",
                h2("Discussion"),
                "Discussion")
        
      )
    )
))
