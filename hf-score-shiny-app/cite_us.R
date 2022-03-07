# Citation information
fluidRow(
  
  # Info text
  column(12,
    HTML("This webapp is based on the results published in: "
         ),

    # tabsetPanel introduced 
         tabsetPanel(
           tabPanel("APA",
                    HTML("Magnussen, C., Brederecke, J., ..., & Schnabel, R.
                         (2022). <i>The European Heart Failure Score</i>.
                         European Heart Journal...")),
           tabPanel("BibTex")
         ), # Close tabsetPanel
    br(),
    HTML("The app itself might be cited as: "
         ),
    # tabsetPanel introduced 
    tabsetPanel(
      tabPanel("APA",
               HTML("Magnussen, C., Brederecke, J., ..., & Schnabel, R.
                         (2022). <i>The European Heart Failure Score App</i>.
                         www.app.com...")),
      tabPanel("BibTex")
    ) # Close tabsetPanel
  )# Close column
) # Close fluidRow    