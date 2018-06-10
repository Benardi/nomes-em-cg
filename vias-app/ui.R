library(shiny)
library(tidyverse)
library(here)
source(here("code/read_wrangle.R"))

# profissoes_nos_dados = read_wrangle_data() %>% 
#     filter(!is.na(profissao)) %>%  
#     pull(profissao) %>% 
#     unique()


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # 
  # # Application title
  titlePanel("Ruas mais compridas têm mais árvores e pontos de ônibus?"),
  # 
  # # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        # selectInput("profissao",
        #             "Profissão",
        #             choices = profissoes_nos_dados),
        # sliderInput("bins",
        #             "Number of bins:",
        #             min = 1,
        #             max = 50,
        #             value = 30),
        sliderInput("comprimento",
                    "Comprimento da rua em metros:",
                    min= 0,
                    max =20000,
                    value = c(0,10000))
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("onibusPlot"),
       # tableOutput("listagem")
       plotOutput("arvoresPlot") #,
       # verbatimTextOutput("range"),
       # verbatimTextOutput("value")
    )
  )
))
