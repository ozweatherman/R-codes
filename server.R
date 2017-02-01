shinyServer(
function(input,output,session){
  output$myplot<-renderPlot({
    distType<-input$Distribution
    size<-input$sampleSize
    if(distType=='Normal'){
      randomVec<-rnorm(size,mean=as.numeric(input$mean),sd=as.numeric(input$std))
    }
    else
    {randomVec<-rexp(size,rate=1/as.numeric(input$lamda))
      }
    hist(randomVec,col='blue')
   
  })
}
  
)