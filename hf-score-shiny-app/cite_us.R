# Citation information
fluidRow(
  
  # Picture on the side
  column(8,
    img(src   = 'cite_us.jpeg',
        align = "left",
        style = "height: 80vh;
                 max-height: 600px;
                 display: block;
                 margin-left: auto;
                 margin-right: auto;")
  ),
  
  # Cite article
  column(4,
    HTML("<b>HOW TO CITE THE ORIGINAL ARTICLE USED TO DERIVE THE APP</b>
         <br>"
         ),
    br(),
    # tabsetPanel introduced 
         tabsetPanel(
           tabPanel("APA",
                    HTML("Magnussen, C., Brederecke, J., ..., & Schnabel, R.
                         (2022). <i>The European Heart Failure Score</i>.
                         European Heart Journal...")),
           tabPanel("BibTeX"),
           tabPanel("DOI",
                    HTML("https://www.doi.org/"))
         ), # Close tabsetPanel
    br(),
    
    # Cite app itself
    HTML("<b>HOW TO CITE THE APP ITSELF</b>
         <br>"),
    br(),
    
    # tabsetPanel introduced 
    tabsetPanel(
      tabPanel("APA",
               HTML("Magnussen, C., Brederecke, J., ..., & Schnabel, R.
                         (2022). <i>The European Heart Failure Score App</i>.
                         www.app.com...")),
      tabPanel("BibTeX")
    ) # Close tabsetPanel
  )# Close column
) # Close fluidRow    