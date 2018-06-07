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

profissoes_nos_dados = vias %>% 
  filter(!is.na(profissao)) %>%  
  pull(profissao) %>% 
  unique()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    prof_selecionada = reactive({input$profissao})
    
    output$distPlot <- renderPlot({
        vias_profissao = vias %>% filter(profissao == prof_selecionada())
        vias_profissao %>% 
            ggplot(aes(x = arvores_100m_mean,..density..)) + 
            geom_histogram(bins= input$bins,
                           boundary = 0,
                           fill="grey",
                           color="black") + 
            scale_x_continuous(limits = c(0, 15),breaks=seq(0,14.5,0.5))
    })
    
    output$listagem <- renderTable({
        vias %>% 
            filter(profissao == prof_selecionada()) %>%
            arrange(comprimento) %>%
            select(nome = nomelograd, 
                   comprimento)
    })
    
})
