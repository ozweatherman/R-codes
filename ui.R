shinyUI(
    pageWithSidebar(
      headerPanel("My First Shinny App"),
      
      sidebarPanel(selectInput("Distribution","Please Select Distribution Type",
                               choices=c("Normal","Exponential")),
                   sliderInput("sampleSize","Please Select Sample Size:", 
                               min=100,max=5000,value=1000,step=100),
                   conditionalPanel(condition="input.Distribution=='Normal'",
                                    textInput("mean","Please enter the mean",10),
                                    textInput("std","Please enter std",3)),
                   conditionalPanel(condition="input.Distribution=='Exponential'",
                                    textInput("lamda","Please enter lamda",1))
                   ),
      
      mainPanel(plotOutput("myplot"))
    )
    )