# This page contains the inputs of the primary model used for the prediction of
# the heart-failure-score

# Here go all the inputs for the predictor variables
fluidRow(
  
  # This is the input area
  
  # Title
  # This is the column to the left (4 units wide)
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
        inputId = "age1_ext",
        label = NULL,
        value = 50,
        min = 50,
        max = 100,
        step = 1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Sex"),         
      selectInput(
        inputId = "male_ext",
        label = NULL,
        choices = c(0, 1), 
        selected = 0,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Body Mass Index"), 
      numericInput(
        inputId = "bmi_ext",
        label = NULL,
        value = 25,
        min = 15,
        max = 60,
        step = 0.1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Diabetes"),
      selectInput(
        inputId = "basediab1_ext",
        label = NULL,
        choices = c(0, 1),
        selected = 0,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Hypertension Medication"),
      selectInput(
        inputId = "drug_hypert_ext",
        label = NULL,
        choices = c(0, 1),
        selected = 0,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Daily Smoker"),
      selectInput(
        inputId = "dsmoker_ext",
        label = NULL,
        choices = c(0, 1),
        selected = 0,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Myocardial Infarctiont"),
      selectInput(
        inputId = "basemi2_ext",
        label = NULL,
        choices = c(0, 1),
        selected = 0,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Alcohol consumption"),
      numericInput(
        inputId = "alcave_ext",
        label = NULL,
        value = 0,
        min = 0,
        max = 40,
        step = 1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Systolic Blood Pressure"),
      numericInput(
        inputId = "systm_ext",
        label = NULL,
        value = 80,
        min = 50,
        max = 250,
        step = 1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Diastolic Blood Pressure"),
      numericInput(
        inputId = "diastm_ext",
        label = NULL,
        value = 100,
        min = 80,
        max = 250,
        step = 1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Levels of NT-proBNP"), 
      numericInput(
        inputId = "nt_pro_bnp_ext",
        label = NULL,
        value = 25,
        min = 0,
        max = 100,
        step = 0.1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Levels of Chola"), 
      numericInput(
        inputId = "chola_ext",
        label = NULL,
        value = 25,
        min = 0,
        max = 100,
        step = 0.1,
        width = 80
      )),
      
      div(style = "display: inline-block;
      vertical-align: top;
      width: 200px;",
      strong("Levels of EGFR"), 
      numericInput(
        inputId = "egfr_ckdepi_crea_ext",
        label = NULL,
        value = 25,
        min = 0,
        max = 100,
        step = 0.1,
        width = 80
      )),
      
      # This introduces the actionButton used to run the calculation
      actionButton("enter_ext", label = "Calculate Risk")
      
  ), # Close column
  
  # Output area
  # This is the column to the right (4 units wide)
  column(4,
         
         # tabsetPanel introduced 
         tabsetPanel(
           tabPanel("Summary", textOutput("prediction_ext")),
           tabPanel("What does this mean?")
         ) ## Close tabsetPanel
  ) # Close column
) # Close fluidRow