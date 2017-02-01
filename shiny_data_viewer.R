#https://www.youtube.com/watch?v=Ido56dwDTg8

#sources: GitHub/r-bloggers/Stack Overflow/Google groups/r-help/Shiny gallery

#shiny dashboard 

#Get inspired: http://shiny.rstudio.com/gallery
#Get started: http://shiny.rstudio.com/tutorial
#Get deeper: http://shiny.rstudio.com/articles
#Need help? Google "shiny-discuss

library(shiny)

ui<-fluidPage(
  h1("Hellow World"),
  sidebarLayout(
    sidebarPanel(
      selectInput('dataset','please select a dataset',choices=ls('package:datasets'),
                  selected='pressure')
      ),
    mainPanel(
      tabsetPanel(
      tabPanel("Structure",verbatimTextOutput('dump')),
      tabPanel("Plot",plotOutput("plot")),
      tabPanel("Table", tableOutput('table'))
  ))

))

server<-function(input,output,session){
  output$dump<-renderPrint({
    dataset<-get(input$dataset,'package:datasets',inherits = FALSE)
    str(dataset)
  })
  output$plot<-renderPlot({
    dataset<-get(input$dataset,'package:datasets',inherits=FALSE)
    plot(dataset)
  })
  output$table<-renderTable({
    dataset<-get(input$dataset,'package:datasets',inherits=FALSE)
    dataset
  })
}

shinyApp(ui,server)
