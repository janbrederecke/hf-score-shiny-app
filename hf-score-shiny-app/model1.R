# Inputs for the predictor variables
fluidRow(
  
  # Input area
  
  # Title
  column(4,
         
    style = "background-color: #E8E8E8",     
         
    div(style = "display: inline-block;
        vertical-align:top;
        text-align:center;
        width: 100%;",
        strong("Enter your information below: ")
    ),

  # Inputs
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Age in years"), 
           numericInput(
             inputId = "age1",
             label = NULL,
             value = 50,
             min = 50,
             max = 100,
             step = 1,
             width = 60
           )),
  
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Sex"),         
           selectInput(
             inputId = "male",
             label = NULL,
             choices = c(0, 1), 
             selected = 0,
             width = 60
           )),
           
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Body Mass Index"), 
           numericInput(
             inputId = "bmi",
             label = NULL,
             value = 25,
             min = 15,
             max = 60,
             step = 0.1,
             width = 60
           )),
           
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Diabetes"),
           selectInput(
             inputId = "basediab1",
             label = NULL,
             choices = c(0, 1),
             selected = 0,
             width = 60
           )),
  
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Hypertension Medication"),
           selectInput(
             inputId = "drug_hypert",
             label = NULL,
             choices = c(0, 1),
             selected = 0,
             width = 60
           )),
  
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Daily Smoker"),
           selectInput(
             inputId = "dsmoker",
             label = NULL,
             choices = c(0, 1),
             selected = 0,
             width = 60
           )),

  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Myocardial Infarctiont"),
           selectInput(
             inputId = "basemi2",
             label = NULL,
             choices = c(0, 1),
             selected = 0,
             width = 60
           )),
           
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Alcohol consumption"),
           numericInput(
             inputId = "alcave",
             label = NULL,
             value = 0,
             min = 0,
             max = 40,
             step = 1,
             width = 60
           )),
  
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Systolic Blood Pressure"),
           numericInput(
             inputId = "systm",
             label = NULL,
             value = 80,
             min = 50,
             max = 250,
             step = 1,
             width = 60
           )),
  
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Diastolic Blood Pressure"),
      numericInput(
        inputId = "diastm",
        label = NULL,
        value = 100,
        min = 80,
        max = 250,
        step = 1,
        width = 60
      )),
  
  div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Levels of NT-proBNP"), 
           numericInput(
             inputId = "nt_pro_bnp",
             label = NULL,
             value = 25,
             min = 0,
             max = 100,
             step = 0.1,
             width = 60
           )),
  
  actionButton("enter", label = "Calculate Risk")
  
  ), # close column
  
  # Output area
  
  column(8,
         
         tabsetPanel(
           tabPanel("Summary"),
           tabPanel("what does this mean?")
          ), ## close tabset panel
         
    div(style = "display: inline-block;
          vertical-align:top;
          text-align:left;
          width: 100%;",
          strong("Your risk for developing heart failure:")
         ),
    
  textOutput("prediction")
  
  ) # close column
  
  
) # close fluidRow