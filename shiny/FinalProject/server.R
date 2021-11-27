#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(DT)
library(usmap)
library(janitor)
library(scales)
data_for_plots <-read_csv("data/ForStatAnalysis.csv")
data_for_table <- data_for_plots %>% select(-ElectionYear ) %>% select(-State_abb) %>% rename('Total Migration'=totalMigration)
map_visualization <- data_for_plots %>% clean_names()
migration_to_next_skew_model <- lm(skew2020 ~ totalMigration,
                                   data = ForStatisticalAnalysis)
migration_to_next_skew_model_summary=summary(migration_to_next_skew_model)
migration_from_previous_election <- lm(skew2020 ~ skew2016 + totalMigration,
                                       data = ForStatisticalAnalysis)
migration_from_previous_election_summary <-summary(migration_from_previous_election)

skew_from_previous_election <- lm(skew2020 ~ skew2016 ,
                                       data = ForStatisticalAnalysis)
skew_from_previous_election_summary <-summary(skew_from_previous_election)

shinyServer(function(input, output) {

    output$base_data <- renderDataTable(
      data_for_table,filter="top",
      options=list(
        pageLength = 10, scrollX=TRUE,  options = list(
          columns = list(searchable = FALSE)
        )
      )
    )
    output$explain <-renderPlot(
      plot_usmap(data = map_visualization, values = "difference", regions = "states") + 
        scale_fill_manual(values = c("blue", "purple", "red"), name="Election") + 
        labs(title = "2020 Election", subtitle = "2020 Election") +
        theme(legend.position = "right")
    )
    output$firstmodel <- renderPrint(migration_to_next_skew_model_summary)
    output$secondmodel <- renderPrint(migration_from_previous_election_summary)
    output$thirdmodel <- renderPrint(skew_from_previous_election_summary)
    output$explain2 <-renderPlot(
        plot_usmap(data = map_visualization, values = "total_migration", regions = "states") + 
                   scale_fill_continuous(low = "red", high = "blue", name = "Migration", label = scales::comma) + 
                   labs(title = "U.S. Migration", subtitle = "Democratic-Republican Migration from other states") +
                   theme(legend.position = "right")
    )
    output$linegraph <-renderPlot(ForStatisticalAnalysis %>% 
                                    ggplot(aes(x=skew2016, y=skew2020, color=difference)) +
                                    geom_point() +
                                    geom_jitter() + 
                                    geom_smooth(method="lm") +
                                    geom_vline(xintercept = 0) +
                                    geom_hline(yintercept = 0) +
                                    scale_x_continuous(labels = comma) +
                                    scale_y_continuous(labels=comma) +
                                    scale_color_manual(values = c("Blue","Purple","Red"))  +
                                    labs(title = "Skew 2016-2020",
                                         subtitle = "Visualizing skew from the last 2 elections",
                                         x = "2016 Skew",
                                         y = "2020 Skew" ))

})
