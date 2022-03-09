# About
fluidRow(
  
  # Project information
  column(4,
    HTML("<b>WHAT IS THE APP GOOD FOR?</b>
         <br>
         The European Heart Failure Score app was designed to enable individual
         prediction for five year risk of heart failure incidence. 
         <br>
         This app is not designed for diagnostic use and results are
         probabilistic in nature.
         <br>"
    ),
    br(),
    
    HTML("<b>WHAT IS THE APP NOT GOOD FOR?</b>
         <br>
         This app is not designed for diagnostic use and results are
         probabilistic in nature.
         <br>"
    ),
    br(),
    
    HTML("<b>WHERE CAN I FIND ADDITIONAL INFORMATION?</b>
         <br>
         For more information on the BiomarCaRE consortium see
         <a href=\"http://www.biomarcare.eu\">biomarcare.eu</a>.
         <br>"
    ),
    br(),
    
    HTML("<b>WHO DEVELOPED THE APP?</b>
         <br>
         The app was developed by Jan Brederecke at the University Medical
         Center Hamburg-Eppendorf (UKE).
         Jan Brederecke is a research assistant at
         the University Heart & Vascular Center Hamburg (UHZ) -
         for more projects see
         <a href=\"https://www.gitlab.com/janbrederecke\">his gitlab profile</a>
         or feel free to connect via 
         <a href=\"https://www.linkedin.com/in/janbrederecke\">LinkedIn</a>.
         <br>"
    )
  ), # Close column
  
  # Developer information
  column(8,
    img(src   = 'about.png',
        style = "width: 100%;
                padding: 0;")
  ), # Close column
) # Close fluidRow          

