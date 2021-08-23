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
            tableOutput("table"),
            textOutput("sum"),
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
    
    output$table <- renderTable({
        new_data()
    })
    
    output$sum <- renderText({
        data <- new_data()
        paste0("The sum of your inputs is: ",
               sum(data$karno, data$diagtime))
    })
    
    output$prediction <- renderText({
        data <- new_data()
        pred <- predict(rsf_model, data)
        pred_matrix <- pred[["survival"]]
        v <- which(pred[["unique.death.times"]] >= 5)
        
        paste0("Your risk is: ",
        round(pred_matrix[v[1]], 2), "%."
        )
    })
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
