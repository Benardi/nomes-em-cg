library(shiny)
library(tidyverse)
library(here)
source(here("./read_wrangle.R"))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # 
  # # Application title
  titlePanel("Ruas mais compridas têm mais árvores? E pontos de ônibus?"),
  
  fluidRow(
      column(1),
      column(5,plotOutput("onibusPlot")),
      column(5,plotOutput("arvoresPlot")),
      column(1)
  ),
  fluidRow(
      column(1),
      column(10,wellPanel(
                 sliderInput("comprimento",
                                "Comprimento da rua em metros:",
                                min= 0,
                                max =20000,
                                value = c(0,10000)))),
      column(1)
  )
))
