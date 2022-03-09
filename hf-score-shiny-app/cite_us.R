# Citation information
fluidRow(
  
  # Picture on the side
  # column(8,
  #   img(src   = 'cite_us.jpeg',
  #       style = "width: 100%;
  #                padding: 0;"
  #   )
  # ),
  
  # Cite article
  column(7,
    HTML("<b>HOW TO CITE THE ORIGINAL ARTICLE USED TO DERIVE THE APP</b>
         <br>"
    ),
    br(),
    # tabsetPanel introduced 
    tabsetPanel(
      tabPanel("APA",
        HTML("Magnussen, C., Brederecke, J., ..., & Schnabel, R.
             (2022). <i>The European Heart Failure Score</i>.
             European Heart Journal...")
        ),
          tabPanel("BibTeX"),
          tabPanel("DOI",
            HTML("https://www.doi.org/")
            )
    ), # Close tabsetPanel
    br(),
    
    # Cite app itself
    HTML("<b>HOW TO CITE THE APP ITSELF</b>
         <br>"
    ),
    br(),
    
    # tabsetPanel introduced 
    tabsetPanel(
      tabPanel("APA",
        HTML("Magnussen, C., Brederecke, J., ..., & Schnabel, R.
             (2022). <i>The European Heart Failure Score App</i>.
             www.app.com...")
        ),
      tabPanel("BibTeX")
    ) # Close tabsetPanel
  )# Close column
) # Close fluidRow    