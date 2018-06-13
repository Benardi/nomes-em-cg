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
library(here)
source(here("./read_wrangle.R"))

vias = read_wrangle_data()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$onibusPlot <- renderPlot({
        vias_comprimento = vias %>%
            filter(comprimento >= input$comprimento[1]) %>%
            filter(comprimento <= input$comprimento[2])
        
        vias_comprimento %>% 
            ggplot(aes(pontoonibu, y=..count../sum(..count..))) +
            geom_bar(
                fill="grey",
                color="black",
                position = 'dodge') +
            scale_x_continuous(limits = c(-2,max(vias_comprimento$pontoonibu) + 2))
        }) 
    
    output$arvoresPlot <- renderPlot({
        vias_comprimento = vias %>%
            filter(comprimento >= input$comprimento[1]) %>%
            filter(comprimento <= input$comprimento[2])
        
        vias_comprimento %>% 
            ggplot(aes(arvores_100m_mean, y=..count../sum(..count..))) +
            geom_histogram(
                fill="darkgreen",
                color="black",
                binwidth = 1)            
                    }) 
    
})
