suppressPackageStartupMessages(c(
  library(shiny),
  library(shinythemes)
))

source("./predictor.R")
load(file = "./finalbigram.RData")
load(file = "./finaltrigram.RData")
load(file = "./finalquadgram.RData")

shinyServer(function(input, output) {
  
  wordPrediction <- reactive({
    textInput <- input$textInput
    wordPrediction <- nextwordpred(textInput)})
  
  output$predictedWord <- renderPrint(wordPrediction())
})
