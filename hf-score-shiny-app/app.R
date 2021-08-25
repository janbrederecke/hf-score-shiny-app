# This is a first approach to building a web-app that calculates HF probability
# based on the HF score project - here we use RSF models for testing purposes

library(shiny)
library(ranger)

load(file = paste0(here::here(), "/hf-score-shiny-app/rsf_primary.RData"))

# Define UI for application
ui <- fluidPage(
        
        # Define navigation bar
        shinyUI(
            navbarPage("European Heart Failure Score",
                       
                       tabPanel("Start" ,
                                source("start.R")$value
                        ),
                        
                       navbarMenu("Choose Model",
                            tabPanel("Model 1",
                                     source("model1.R")$value)
                        ),
                        tabPanel("About",
                                     source("the_score.R")$value)
                       
            ) # close navbarPage
        ), # close shinyUI
) # close fluidPage

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
    
} # close server function 

# Run the application 
shinyApp(ui = ui, server = server)
