#shiny dashboard
#source: http://rstudio.github.io/shinydashboard/
# http://rstudio.github.io/shinydashboard/appearance.html
# http://leafletjs.com/; http://rstudio.github.io/leaflet/
# data from: www.pilrhealth.com

# https://www.youtube.com/watch?v=I5Z9WtTBZ_w



library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)

#load data
library(rNOMADS)





ui <-dashboardPage(
  dashboardHeader(title="Weather Query"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(width = 3,
        textInput("lat","Please enter Latitude in Degree ('-' for west):"),
        textInput("lon","Please enter Longitude in Degree ('-' for south):")
      ),
      box(width=6,plotOutput("plot1",height=250)),
      box(width=3,title='Control Center',
          selectInput("selection","Pls select parameter",choices=names(data),selected='SWH')
          )
    ),
    leafletOutput("map")
    )
  )


sever<-function(input,output,session){
  
  output$plot1<-renderPlot({
    selct<-input$selection
    pt<-ggplot(data)+aes(
    x=as.Date(paste(dd,mm,year,sep='/',format='%d/%m/%Y')),y=data[[input$selection]])+geom_line()
    print(pt)
  })

  
  output$map<-renderLeaflet({
      leaflet() %>%
      addTiles() %>%
      setView(input$lon,input$lat,zoom=12)
  })
}

runApp(shinyApp(ui,sever),launch.browser=TRUE)