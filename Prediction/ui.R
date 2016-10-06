library(shiny)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("united"),
  tags$span(titlePanel("Data Science Capstone: Predictive Text Modelling"), align = "center"),
  p(strong("Course Goal:"),
              "To create an algorithm that will", 
              strong(tags$em("predict the next word")), 
              "of a single word or text phrase.", align = "center"),
  br(),
  tags$hr(),
  tags$span(style = "color:red", h3("Next Word Prediction Application Demo", align = "center")),
  tags$div(textInput("textInput", 
            label = "Enter Word or Phrase Below"), align = "center"),
  tags$span(style = "color:grey", 
            p(strong("Note:"), 
            tags$i("This application supports english words only"), 
            align = "center")),
  br(),
  br(),
  tags$span(style = "color:red", h3("Next Word Predictor Result", align = "center")),
  tags$span(style = "color:blue", 
            tags$h4(textOutput("predictedWord"), 
                    align = "center")),
  br(),
  tags$hr(),
  p(strong("Note:"), "Due to the limited corpus data and processing time, 
    the predictor application is not the most efficient machine for 
    predicting the next words for some text phrases and words."),
  br(),
  tags$hr(),
  tags$span(p("For more information about the course description, visit the course website @", 
            tags$a(href = "https://www.coursera.org/learn/data-science-project/home/welcome", "Coursera")),
            align = "center"),
  tags$hr(),
  tags$span(tags$footer(("© 2016 -"), 
            tags$a(href="http://sandraez.com",
                   target = "_blank",
                   "Sandra Ezidiegwu"), align = "center"))
                   )
                   
                   