# This shiny-app calculates the predicted 5-year risk for heart failure
# Developer: Jan Brederecke, https://www.linkedin.com/in/janbrederecke
# The app is based on the research published in ...

# Load packages
library(shiny)
library(survival)
library(pmisc)

# Load cox-model for prediction
load(file = c(paste0(here::here(),
                     "/hf-score-shiny-app/pred_model_primary.RData")))

# Load custom prediction-function to predict using Weibull-baseline-hazard
source(paste0(here::here(),
              "/hf-score-shiny-app/Wb_EventProb_nodata.R"))

# Define UI for application
ui <- fluidPage(
        
        # Define navigation bar
        shinyUI(
            navbarPage("European Heart Failure Score",
                       
                       tabPanel("Start" ,
                                source("start.R")$value
                        ),
                        
                       navbarMenu("Choose Model",
                            tabPanel("Biomarker Score",
                                     source("bm_score.R")$value
                            ),
                            tabPanel("Extended Biomarker Score",
                                      source("ext_bm_score.R")$value
                            )
                        ),
                       
                        tabPanel("About",
                                 source("about.R")$value
                        ),
                       
                       tabPanel("Cite us",
                                source("cite_us.R")$value)
                       
            ) # Close navbarPage
        ), # Close shinyUI
) # Close fluidPage

# Define server logic required to predict from the Cox-model
server <- function(input, output, session) {
    
    # Define reactive input
    new_data <- eventReactive(input$enter, {
        
        # Generate input
        data.frame(
            bmi           = input$bmi,
            dsmoker       = as.numeric(input$dsmoker),
            drug_hypert   = as.numeric(input$drug_hypert),
            basediab1     = as.numeric(input$basediab1),
            basemi2       = as.numeric(input$basemi2),
            alcave_ln     = log(input$alcave + 1),
            systm         = input$systm,
            diastm        = input$diastm,
            age1          = input$age1,
            male          = input$male,
            nt_pro_bnp_ln = log(input$nt_pro_bnp),
        stringsAsFactors = FALSE
        )
    }) # Close eventReactive
    
    # Define text-ouput including predicted event-probability
    output$prediction <- renderText({
        
        # Turn the reactive input into a usable dataframe
        data <- as.data.frame(new_data())
       
        # Predict event-probability
        event_prob_5 <- Wb_EventProb_nodata(
            wb_info_primary,
            timepoint = 5,
            newdata = data,
            newdata_timestart = "age1"
        )

        paste0("Your estimated risk for HF within 5 years is: ",
               round((event_prob_5) * 100, 2),
               "%.")
    }) # Close renderText
    
} # Close server function 

# Run the application 
shinyApp(ui = ui, server = server)
