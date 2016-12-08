
library(shiny)
library(e1071)
library(randomForest)
library(caret)


in1<-createDataPartition(iris$Species,p=0.80,list=FALSE)
Train<-iris[in1,]
Test<-iris[-in1,]

#Random Forest com bootstrapping
Mod1<-train (Species~.,data=Train,method="rf")
ResultPrev1<-predict(Mod1,Test)
conf<-confusionMatrix(Test$Species,ResultPrev1)
#9957% accuracy


shinyServer(
  function(input, output) {
    
    NomeResult <- reactive({
      xy<-data.frame(Sepal.Length=input$SLen,Sepal.Width=input$Swid,Petal.Length=input$PLen,Petal.Width=input$Pwid)
      re<-predict(Mod1,xy)
      levels(re)[re]
    })
    
    output$plot1 <- renderPlot({
    #plot(5,as.numeric(input$LinePos),xlim=c(-10,10),ylim=c(-10,10))
    
    par(mfrow=c(1,2))
    
    plot(iris$Sepal.Length,iris$Sepal.Width,col=iris$Species,main="Sepal", xlab="Length", ylab="Width")
    
    abline(h=as.numeric(input$Swid))
    abline(v=as.numeric(input$SLen))
    
    plot(iris$Petal.Length,iris$Petal.Width,col=iris$Species,main="Petal", xlab="Length", ylab="Width")
    abline(h=as.numeric(input$Pwid))
    abline(v=as.numeric(input$PLen))
    
    })
    output$Swid<-renderText({input$Swid})
    output$SLen<-renderText({input$SLen})
    output$Pwid<-renderText({input$Pwid})
    output$PLen<-renderText({input$PLen})
    output$Resultado<-renderText({paste('The most possible specie considering the given information is',"<font color=\"#FF0000\"><b>",NomeResult(),"</b></font>")})
  }
)

