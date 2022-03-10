# This page contains the inputs of the primary model used for the prediction of
# the heart-failure-score

# Here go all the inputs for the predictor variables
fluidRow(
  
  # Move all the input labels to the left
  tags$head(
    tags$style(type = "text/css",
                "label.control-label,
                .selectize-control.single {
                  display: table-cell;
                  text-align: left;
                  vertical-align : middle;
                  width: 340px;
                }
                .form-group {
                  display: table-row;
                }
                "
    )
  ),
  
  # This is the input area
  
  # Title
  # This is the column to the left
  column(3,
  
    # Inputs
    numericInput(
      inputId = "age1",
      label   = "Your age in years",
      value   = 50,
      min     = 50,
      max     = 100,
      step    = 1
    ),

    div(style = "margin-top: 6px"),
    
    selectInput(
      inputId  = "male",
      label    = "Your sex",
      choices  = c(0, 1), 
      selected = 0
    ),
             
    numericInput(
      inputId = "bmi",
      label   = "Your Body Mass Index (BMI)",
      value   = 25,
      min     = 15,
      max     = 60,
      step    = 0.1
    ),

    div(style = "margin-top: 6px"),
    
    selectInput(
      inputId  = "basediab1",
      label    = "Do you have diabetes?",
      choices  = c(0, 1),
      selected = 0
    ),
    
    selectInput(
      inputId  = "drug_hypert",
      label    = "Do you take ani-hypertension medication?",
      choices  = c(0, 1),
      selected = 0
    ),
    
    selectInput(
      inputId  = "dsmoker",
      label    = "Do you smoke regularly?",
      choices  = c(0, 1),
      selected = 0
    ),
  
    selectInput(
        inputId  = "basemi2",
        label    = "Have you had myocardial infarction in the past?",
        choices  = c(0, 1),
        selected = 0
    ),
    
    numericInput(
      inputId = "alcave",
      label   = "Number of drinks you consume daily",
      value   = 0,
      min     = 0,
      max     = 40,
      step    = 1
    ),
  
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "systm",
      label   = "Systolic blood pressure",
      value   = 80,
      min     = 50,
      max     = 250,
      step    = 1
    ),
    
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "diastm",
      label = "Diastolic blood pressure",
      value = 100,
      min = 80,
      max = 250,
      step = 1
    ),
    
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "nt_pro_bnp",
      label   = "Levels of NT-proBNP",
      value   = 25,
      min     = 0,
      max     = 100,
      step    = 0.1
    ),
    
    div(style = "margin-top: 6px"),
    
    # This introduces the actionButton used to run the calculation
    actionButton("enter", label = "Calculate Risk")
    ), # Close column
  
  # Output area

  # This is the column to the right 
  column(4,
    # tabsetPanel introduced 
    tabsetPanel(
      # Get a summary panel
      tabPanel("RESULTS",
        textOutput("prediction")
      ) # Close tabPanel
    ) # Close tabsetPanel
  ) # Close column
) # Close fluidRow