
library(lsa)

taste<-read.csv("http://s3-us-west-1.amazonaws.com/backupcoursera/taste.csv")
taste<-data.frame(taste)

similar <- function(vector_comp){
  
  max_proj=0
  num=dim(taste)[1]
  for (n in 1:num){
    v1<-as.numeric(taste[n,3:8])
    proj<-cosine(v1,vector_comp)
    proj[is.na(proj)]<-0
    if (proj>max_proj) {
      i<-n
      max_proj<-proj
    }
  }
  return(taste$avg.rating[i])
}

shinyServer(function(input, output, session) {
  
  tastiness <- reactive({
    c(input$sweet,input$salty,input$umami,input$sour,input$bitter,input$piquant)
  })
  
  output$text1 <- renderText({
    paste(similar(as.numeric(tastiness()))," out of 5")
    
  })
  
})
