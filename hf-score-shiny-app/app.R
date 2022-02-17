# The Shiny web-app that calculates 5-year risk for incident HF based on the developed score
library(shiny)
library(survival)
library(pmisc)

# Load Cox-models for prediction
load(file = c(paste0(here::here(),
                     "/hf-score-shiny-app/pred_model_primary.RData")))
load(file = c(paste0(here::here(),
                     "/hf-score-shiny-app/pred_model_secondary.RData")))

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
                                     source("model1.R")$value)
                        ),
                        tabPanel("About",
                                     source("about.R")$value)
                       
            ) # close navbarPage
        ), # close shinyUI
) # close fluidPage

# Define server logic required to predict from the Cox-model
server <- function(input, output, session) {
    
    new_data <- eventReactive(input$enter, {
        data.frame(
            bmi           = input$bmi,
            dsmoker       = input$dsmoker,
            drug_hypert   = input$drug_hypert,
            basediab1     = input$basediab1,
            basemi2       = input$basemi2,
            alcave_ln     = log(input$alcave),
            systm         = input$systm,
            diastm        = input$diastm,
            age1          = input$age1,
            male          = input$male,
            nt_pro_bnp_ln = log(input$nt_pro_bnp),
        stringsAsFactors = FALSE
        )
    })

    output$prediction <- renderText({
        data <- new_data()
        

        
event_prob_5 <- Wb_EventProb(fit = pred_model_primary,
             timepoint = 5, 
             param = c(-4.808491, -705.2948),
             newdata = data,
             newdata_timestart = data$age1, 
             control = list(fnscale = -1, parscale = c(0.1, 0.1), maxit = 2000)
            )

 

            
        
        
        
        
        
        paste0("Your estimated risk for HF within 5 years is: ",
        round((event_prob_5) * 100, 2), "%."
        )
    })
    
} # close server function 

# Run the application 
shinyApp(ui = ui, server = server)
