library(shiny)


shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Predict Next Word"),
    
    sidebarPanel(
      textInput("TextInput", label = h3("Text Input"), value = "" )
    ),
    mainPanel(
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Next Word'),
      verbatimTextOutput("prediction")
    )
  )
)
