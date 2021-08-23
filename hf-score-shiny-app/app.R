# This is a first approach to building a web-app that calculates HF probability
# based on the HF score project - here we use RSF models for testing purposes

library(shiny)
library(ranger)

load(file = paste0(here::here(), "/hf-score-shiny-app/rsf_primary.RData"))

# Define UI for application
ui <- fluidPage(
    # Application title
    titlePanel("Biomarcare Heart Failure Score Calculator"),
    
    # Sidebar with inputs for the predictor variables
    sidebarLayout(
        sidebarPanel(
            # Inputs:
            numericInput(
                inputId = "age1",
                label = "Age in years",
                value = 50,
                min = 50,
                max = 100,
                step = 1
            ),
            hr(),
            selectInput(
                inputId = "male",
                label = "Sex",
                choices = c(0, 1),
                selected = 0
            ),
            hr(),
            numericInput(
                inputId = "bmi",
                label = "Body Mass Index",
                value = 25,
                min = 15,
                max = 60,
                step = 0.1
            ),
            hr(),
            selectInput(
                inputId = "basediab1",
                label = "Diabetes",
                choices = c(0, 1),
                selected = 0
            ),
            hr(),
            selectInput(
                inputId = "drug_hypert",
                label = "Hypertension Medication",
                choices = c(0, 1),
                selected = 0
            ),
            hr(),
            selectInput(
                inputId = "dsmoker",
                label = "Daily Smoker",
                choices = c(0, 1),
                selected = 0
            ),
            hr(),
            selectInput(
                inputId = "basemi2",
                label = "Myocardial Infarction in the past",
                choices = c(0, 1),
                selected = 0
            ),
            hr(),
            numericInput(
                inputId = "alcave",
                label = "Alcohol consumption",
                value = 0,
                min = 0,
                max = 40,
                step = 1
            ),
            hr(),
            numericInput(
                inputId = "systm",
                label = "Systolic Blood Pressure",
                value = 80,
                min = 50,
                max = 250,
                step = 1
            ),
            hr(),
            numericInput(
                inputId = "nt_pro_bnp",
                label = "Levels of NT-proBNP",
                value = 25,
                min = 0,
                max = 100,
                step = 0.1
            ),
            hr(),
            
            
            actionButton("enter", label = "Enter Values"),
            width = 2
            
        ),
        
        # Main panel for displaying outputs
        mainPanel(
            titlePanel("Here goes the output"),
            textOutput("prediction")
            
        )
    )
)

# Define server logic required to predict from the rsf model
server <- function(input, output, session) {
    
    new_data <- eventReactive(input$enter, {
        data.frame(
            bmi = input$bmi,
            dsmoker = input$dsmoker,
            drug_hypert = input$drug_hypert,
            basediab1 = input$basediab1,
            basemi2 = input$basemi2,
            alcave = input$alcave,
            systm = input$systm,
            age1 = input$age1,
            male = input$male,
            nt_pro_bnp_ln = log(input$nt_pro_bnp),
            stringsAsFactors = FALSE
        )
    })

    output$prediction <- renderText({
        data <- new_data()
        pred <- predict(rsf_model, data)
        pred_matrix <- pred[["survival"]]
        v <- which(pred[["unique.death.times"]] >= (365.25*5))

        paste0("Your estimated risk for HF within 5 years is: ",
        round((1 - pred_matrix[v[1]]) * 100, 2), "%."
        )
    })
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
