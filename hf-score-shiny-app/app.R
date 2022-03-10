# This shiny-app calculates the predicted 5-year risk for heart failure
# Developer: Jan Brederecke
# The app is based on the research published in ...

# Load packages
library(shiny)
library(shinythemes)
library(shinyWidgets)
library(survival)
library(pmisc)

# Load Cox-models for prediction
## Biomarker Score
load(file = c(paste0(here::here(),
                     "/hf-score-shiny-app/pred_model_primary.RData")))

## Extended Biomarker Score
load(file = c(paste0(here::here(),
                     "/hf-score-shiny-app/pred_model_secondary.RData")))

# Load custom prediction-function to predict using Weibull-baseline-hazard
source(paste0(here::here(),
              "/hf-score-shiny-app/Wb_EventProb_nodata.R"))

# Define UI for application
ui <- fluidPage(theme = shinytheme("cosmo"),
                setBackgroundImage("background.jpg"),
                
                # Global control of the corners of input fields (not round!)
                tags$head(
                    tags$style(
                        HTML(
                            ".form-control {
                            border-radius: 0px 0px 0px 0px;
                            }
                            .selectize-input {
                            border-radius: 0px 0px 0px 0px;
                            }"
                        ) # Close HTML
                    ) # Close tags$style
                ), # Close tags$head
        
    # Define navigation bar
    shinyUI(
        navbarPage("THE EUROPEAN HEART FAILURE SCORE RISK CALCULATOR",
                       
            tabPanel("START" ,
                     source("start.R")$value
            ),
                        
            navbarMenu("CHOOSE MODEL",
                    
                tabPanel("BIOMARKER SCORE",
                         source("test.R")$value
                ),
                tabPanel("EXTENDED BIOMARKER SCORE",
                         source("bm_score_ext.R")$value
                )
            ),
            
            tabPanel("CITE US",
                     source("cite_us.R")$value
            ),
                       
            tabPanel("ABOUT",
                     source("about.R")$value
            )
        ) # Close navbarPage
    ), # Close shinyUI
) # Close fluidPage

# Define server logic required to predict from the Cox-models
server <- function(input, output, session) {

### Biomarker Score
    # Define reactive input 
    new_data_bm <- eventReactive(input$enter, {
        
        # Generate input
        data.frame(
            bmi              = input$bmi,
            dsmoker          = as.numeric(input$dsmoker),
            drug_hypert      = as.numeric(input$drug_hypert),
            basediab1        = as.numeric(input$basediab1),
            basemi2          = as.numeric(input$basemi2),
            alcave_ln        = log(input$alcave + 1),
            systm            = input$systm,
            diastm           = input$diastm,
            age1             = input$age1,
            male             = input$male,
            nt_pro_bnp_ln    = log(input$nt_pro_bnp),
            stringsAsFactors = FALSE
        )
    }) # Close eventReactive
    
    # Define text-ouput including predicted event-probability
    output$prediction <- renderText({
        
        # Turn the reactive input into a usable dataframe
        data_bm <- as.data.frame(new_data_bm())
       
        # Predict event-probability
        event_prob_5_bm <- Wb_EventProb_nodata(
            wb_info_primary,
            timepoint         = 5,
            newdata           = data_bm,
            newdata_timestart = "age1"
        )

        paste0(round((event_prob_5_bm) * 100, 2), "%")
    }) # Close renderText

### Extended Biomarker Score
    # Define reactive input 
    new_data_bm_ext <- eventReactive(input$enter_ext, {
        
        # Generate input
        data.frame(
            bmi              = input$bmi_ext,
            dsmoker          = as.numeric(input$dsmoker_ext),
            drug_hypert      = as.numeric(input$drug_hypert_ext),
            basediab1        = as.numeric(input$basediab1_ext),
            basemi2          = as.numeric(input$basemi2_ext),
            alcave_ln        = log(input$alcave_ext + 1),
            systm            = input$systm_ext,
            diastm           = input$diastm_ext,
            age1             = input$age1_ext,
            male             = input$male_ext,
            nt_pro_bnp_ln    = log(input$nt_pro_bnp_ext),
            chola            = input$chola_ext,
            egfr_ckdepi_crea = input$egfr_ckdepi_crea_ext,
            stringsAsFactors = FALSE
        )
    }) # Close eventReactive
    
    # Define text-ouput including predicted event-probability
    output$prediction_ext <- renderText({
        
        # Turn the reactive input into a usable dataframe
        data_bm_ext <- as.data.frame(new_data_bm_ext())
        
        # Predict event-probability
        event_prob_5_bm_ext <- Wb_EventProb_nodata(
            wb_info_secondary,
            timepoint         = 5,
            newdata           = data_bm_ext,
            newdata_timestart = "age1"
        )
        
        paste0(round((event_prob_5_bm_ext) * 100, 2), "%")
    }) # Close renderText
    
} # Close server function 

# Run the application 
shinyApp(ui = ui, server = server)