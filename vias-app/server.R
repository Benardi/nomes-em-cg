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
source(here("code/read_wrangle.R"))

vias = read_wrangle_data()

# profissoes_nos_dados = vias %>% 
#   filter(!is.na(profissao)) %>%  
#   pull(profissao) %>% 
#   unique()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$range <- renderPrint({ input$comprimento })
    output$value <- renderPrint({ input$comprimento[1]})
    
    # prof_selecionada = reactive({input$profissao})
    
    output$distPlot <- renderPlot({
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
    
    # output$listagem <- renderTable({
    #     vias %>% 
    #         filter(profissao == prof_selecionada()) %>%
    #         arrange(comprimento) %>%
    #         select(nome = nomelograd, 
    #                comprimento)
    # })
    
})
