# This is a first approach to building a web-app that calculates HF probability
# based on the HF score project - here we use RSF models for testing purposes

library(shiny)
library(ranger)

load(file = paste0(here::here(), "/rsf_model.RData"))

# Define UI for application
ui <- fluidPage(
    # Application title
    titlePanel("Biomarcare Heart Failure Score Calculator"),
    
    # Sidebar with inputs for the predictor variables
    sidebarLayout(
        sidebarPanel(
            # Inputs:
            numericInput(
                inputId = "karno",
                label = "Karnovfsky Index",
                value = 50,
                min = 10,
                max = 100,
                step = 1
            ),
            hr(),
            numericInput(
                inputId = "diagtime",
                label = "Time since diagnosis",
                value =  10,
                min = 1,
                max = 85,
                step = 1
            ),
            hr(),
            selectInput(
                inputId = "trt",
                label = "Tumortype",
                choices = c(1, 2),
                selected = 1
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
            trt = input$trt,
            karno = input$karno,
            diagtime = input$diagtime,
            stringsAsFactors = FALSE
        )
    })
    
    output$prediction <- renderText({
        data <- new_data()
        pred <- predict(rsf_model, data)
        pred_matrix <- pred[["survival"]]
        v <- which(pred[["unique.death.times"]] >= 5)
        
        paste0("Your estimated risk for HF within 5 years is: ",
        round(pred_matrix[v[1]], 2), "%."
        )
    })
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
