library(shiny)

# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Biomarcare Heart Failure Score Calculator"),

    # Sidebar with inputs for the predictor variables
    sidebarLayout(
        sidebarPanel(
            
            # Inputs: 
            numericInput(inputId = "karno",
                         label = "Karnovfsky Index",
                         value = 50,
                         min = 10,
                         max = 100,
                         step = 1),
            hr(),
            numericInput(inputId = "diagtime",
                         label = "Time since diagnosis",
                         value =  10,
                         min = 1,
                         max = 85,
                         step = 1),
            hr(),
            selectInput(inputId = "trt",
                        label = "Tumortype",
                        choices = c(1, 2),
                        selected = 1), 
            hr()
            
        ),
        
            # Main panel for displaying outputs
    mainPanel(
                
         uiOutput("text")       
                
    )
    )
)

# Define server logic required to predict from the rsf model
server <- function(input, output) {
load(file = paste0(here::here(),"/rsf_model.RData"))
    # new_data <- data.frame(trt = input$trt,
    #                        karno = input$karno,
    #                        diagtime = input$diagtime)
    # output$prediction <- ranger::predict(rsf_model, newdata = new_data)
    
}

# Run the application 
shinyApp(ui = ui, server = server)
