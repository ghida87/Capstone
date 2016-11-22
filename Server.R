library(shiny)
library(stringr)


load("ngram.RData")


source("prediction_Algo.R")


shinyServer(
 function(input, output) {
    
      #wordPrediction <- reactive({
      #text <- input$TextInput
      #wordPrediction <- Predict_Next(text,final_bigrams_matrix,final_trigrams_matrix)})
    
   output$prediction <- renderPrint({Predict_Next(input$TextInput,final_bigrams_matrix,final_trigrams_matrix)},quoted = FALSE)
   output$inputValue <- renderPrint({input$TextInput},quoted = FALSE)
    
 }

)  