#shiny dashboard
#source: http://rstudio.github.io/shinydashboard/
# http://rstudio.github.io/shinydashboard/appearance.html
# http://leafletjs.com/; http://rstudio.github.io/leaflet/
# data from: www.pilrhealth.com

# https://www.youtube.com/watch?v=I5Z9WtTBZ_w



library(shiny)
library(shinydashboard)
library(leaflet)

ui <-dashboardPage(
  dashboardHeader(title="Basic Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(plotOutput("plot1",height=250)),
      box(title='Controls',
          sliderInput("slider","observations:",min=1,max=100,value=50)
          )
    ),
    leafletOutput("map")
    )
  )


sever<-function(input,output,session){
  output$plot1<-renderPlot({hist(rnorm(input$slider))
    })
  output$map<-renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(31,120,zoom=17)
  })
}

shinyApp(ui,sever)