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
      inputId = "age1_ext",
      label   = "Your age in years",
      value   = 50,
      min     = 50,
      max     = 100,
      step    = 1
    ),

    div(style = "margin-top: 6px"),
    
    selectInput(
      inputId  = "male_ext",
      label    = "Your sex",
      choices  = c(0, 1), 
      selected = 0
    ),
             
    numericInput(
      inputId = "bmi_ext",
      label   = "Your Body Mass Index (BMI)",
      value   = 25,
      min     = 15,
      max     = 60,
      step    = 0.1
    ),

    div(style = "margin-top: 6px"),
    
    selectInput(
      inputId  = "basediab1_ext",
      label    = "Do you have diabetes?",
      choices  = c(0, 1),
      selected = 0
    ),
    
    selectInput(
      inputId  = "drug_hypert_ext",
      label    = "Do you take ani-hypertension medication?",
      choices  = c(0, 1),
      selected = 0
    ),
    
    selectInput(
      inputId  = "dsmoker_ext",
      label    = "Do you smoke regularly?",
      choices  = c(0, 1),
      selected = 0
    ),
  
    selectInput(
        inputId  = "basemi2_ext",
        label    = "Have you had myocardial infarction in the past?",
        choices  = c(0, 1),
        selected = 0
    ),
    
    numericInput(
      inputId = "alcave_ext",
      label   = "Number of drinks you consume daily",
      value   = 0,
      min     = 0,
      max     = 40,
      step    = 1
    ),
  
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "systm_ext",
      label   = "Systolic blood pressure",
      value   = 80,
      min     = 50,
      max     = 250,
      step    = 1
    ),
    
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "diastm_ext",
      label = "Diastolic blood pressure",
      value = 100,
      min = 80,
      max = 250,
      step = 1
    ),
    
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "nt_pro_bnp_ext",
      label   = "Levels of NT-proBNP",
      value   = 25,
      min     = 0,
      max     = 100,
      step    = 0.1
    ),
    
    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "chola_ext",
      label   = "Levels of total cholesterol",
      value   = 25,
      min     = 0,
      max     = 100,
      step    = 0.1
    ),

    div(style = "margin-top: 6px"),
    
    numericInput(
      inputId = "egfr_ckdepi_crea_ext",
      label   = "Levels of eGFR",
      value   = 25,
      min     = 0,
      max     = 100,
      step    = 0.1
    ),
    
    div(style = "margin-top: 6px"),
    
    # This introduces the actionButton used to run the calculation
    actionButton("enter_ext", label = "Calculate Risk")
    ), # Close column
  
  # Output area

  # This is the column to the right 
  column(4,
    # tabsetPanel introduced 
    tabsetPanel(
      # Get a summary panel
      tabPanel("RESULTS",
        textOutput("prediction_ext")
      ) # Close tabPanel
    ) # Close tabsetPanel
  ) # Close column
) # Close fluidRow