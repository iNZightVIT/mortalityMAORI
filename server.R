
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(reshape)
library(plyr)

shinyServer(function(input, output) {

  
  output$LISTpop1 <- renderUI({
    
      
      wellPanel(
        h2("Population 1"),
        sliderInput("year1", label = "Year range (start and end)",
                    min = 1998, max = 2009, step = 1, value = c(1998,2009)),
        selectInput("age1", label = "Age bands", choices = c("Single", "5 years")),
        selectInput("ethnic1", label = "Ethnicity", choices = c("Non-Maori"=1,"Maori"=2, "Total"=3)),
        selectInput("gender1", label = "Gender", choices = c("Female"=1, "Male"=2, "Total"=3)),
        selectInput("cause1", label = "Mortality Cause", choices = c("All cause", "B", "C", "D", "E", "F"), multiple = TRUE, selectize = FALSE),
        #selectInput("region1", label = "Region", choices = c("All NZ/Aotearoa", "B", "C", "D", "E", "F", "G"))
        radioButtons('sub1', label = "Region", 
                     choices = c("All NZ"=1, "DHB"=2, "TLA"=3, "_Client specific list"=4)
        ),
        uiOutput('subLIST1')
      )
  })
  
  output$LISTpop2 <- renderUI({
    
    if (input$SELECTpop>1) {
      wellPanel(
        h2("Population 2"),
        sliderInput("year2", label = "Year range (start and end)",
                    min = 1998, max = 2009, step = 1, value = c(1998,2009)),
        selectInput("age2", label = "Age bands", choices = c("Single", "5 years")),
        selectInput("ethnic2", label = "Ethnicity", choices = c("Maori", "Non-Maori", "Total")),
        selectInput("gender2", label = "Gender", choices = c("Male", "Female", "Total")),
        selectInput("cause2", label = "Mortality Cause", choices = c("All cause", "B", "C", "D", "E", "F"), multiple = TRUE, selectize = FALSE),
        #selectInput("region2", label = "Region", choices = c("All NZ/Aotearoa", "B", "C", "D", "E", "F", "G"))        
        radioButtons('sub2', label = "Region", 
                     choices = c("All NZ"=1, "DHB"=2, "TLA"=3, "_Client specific list"=4)
        ),
        uiOutput('subLIST2')
      )
    }
    
  })
  
  output$LISTpop3 <- renderUI({
    
    if (input$SELECTpop>2) {
      wellPanel(
        h2("Population 3"),
        sliderInput("year3", label = "Year range (start and end)",
                    min = 1998, max = 2009, step = 1, value = c(1998,2009)),
        selectInput("age3", label = "Age bands", choices = c("Single", "5 years")),
        selectInput("ethnic3", label = "Ethnicity", choices = c("Maori", "Non-Maori", "Total")),
        selectInput("gender3", label = "Gender", choices = c("Male", "Female", "Total")),
        selectInput("cause3", label = "Mortality Cause", choices = c("All cause", "B", "C", "D", "E", "F"), multiple = TRUE, selectize = FALSE),
        #selectInput("region3", label = "Region", choices = c("All NZ/Aotearoa", "B", "C", "D", "E", "F", "G"))        
        radioButtons('sub3', label = "Region", 
                     choices = c("All NZ"=1, "DHB"=2, "TLA"=3, "_Client specific list"=4)
        ),
        uiOutput('subLIST3')
      )
    }
    
  })
  
  output$LISTpop4 <- renderUI({
    
    if (input$SELECTpop>3) {
      wellPanel(
        h2("Population 4"),
        sliderInput("year4", label = "Year range (start and end)",
                    min = 1998, max = 2009, step = 1, value = c(1998,2009)),
        selectInput("age4", label = "Age bands", choices = c("Single", "5 years")),
        selectInput("ethnic4", label = "Ethnicity", choices = c("Maori", "Non-Maori", "Total")),
        selectInput("gender4", label = "Gender", choices = c("Male", "Female", "Total")),
        selectInput("cause4", label = "Mortality Cause", choices = c("All cause", "B", "C", "D", "E", "F"), multiple = TRUE, selectize = FALSE),
        #selectInput("region4", label = "Region", choices = c("All NZ/Aotearoa", "B", "C", "D", "E", "F", "G"))   
        radioButtons('sub4', label = "Region", 
                     choices = c("All NZ"=1, "DHB"=2, "TLA"=3, "_Client specific list"=4)
        ),
        uiOutput('subLIST4')
      )
    }
    
  })
  
  output$subLIST1 <- renderUI({
    

    
    end <- div()
    
    if (input$sub1 == 2){
      
      end <- selectInput('sub1.1', label = "DHB", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub1 == 3){
      
      end <- selectInput('sub1.2', label = "TLA", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub1 == 4){
      
      end <- selectInput('sub1.3', label = "RANGE", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    end
    
  })
  
  output$subLIST1 <- renderUI({
    
    
    
    end <- div()
    
    if (input$sub1 == 2){
      
      end <- selectInput('sub1.1', label = "DHB", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub1 == 3){
      
      end <- selectInput('sub1.2', label = "TLA", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub1 == 4){
      
      end <- selectInput('sub1.3', label = "RANGE", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    end
    
  })
  
  output$subLIST2 <- renderUI({
    
    
    
    end <- div()
    
    if (input$sub2 == 2){
      
      end <- selectInput('sub2.1', label = "DHB", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub2 == 3){
      
      end <- selectInput('sub2.2', label = "TLA", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub2 == 4){
      
      end <- selectInput('sub2.3', label = "RANGE", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    end
    
  })
  
  output$subLIST3 <- renderUI({
    
    
    
    end <- div()
    
    if (input$sub3 == 2){
      
      end <- selectInput('sub3.1', label = "DHB", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub3 == 3){
      
      end <- selectInput('sub3.2', label = "TLA", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub3 == 4){
      
      end <- selectInput('sub3.3', label = "RANGE", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    end
    
  })
  
  output$subLIST4 <- renderUI({
    
    
    
    end <- div()
    
    if (input$sub4 == 2){
      
      end <- selectInput('sub4.1', label = "DHB", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub4 == 3){
      
      end <- selectInput('sub4.2', label = "TLA", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    if (input$sub4 == 4){
      
      end <- selectInput('sub4.3', label = "RANGE", choices = c("A"=1,"B"=2,"C"=3), multiple= TRUE, selectize=FALSE)
      
    }
    
    end
    
  })
  
  testShowCalc <- reactive({
    
    d1 = ddply(temppp2, .(AGE_5bands, Year, Gender, fromMaori), nrow, .drop=FALSE)
    out = cast(d1, AGE_5bands~Year~Gender~fromMaori)
    if (!is.null(input$gender1) && !is.null(input$ethnic1)){
      
      #       if (input$gender1 == "2" & input$ethnic1 == "2")
      #         out = out[,,2,2]
      #       if (input$gender1 == "1" & input$ethnic1 == "2")
      #         out = out[,,1,2]  
      #       
      #       if (input$gender1 == "2" & input$ethnic1 == "1")
      #         out = out[,,2,1]
      #       if (input$gender1 == "1" & input$ethnic1 == "1")
      #         out = out[,,1,1]  
      
      if (input$gender1 != "3" & input$ethnic1 != "3")
        out = out[,,as.numeric(input$gender1), as.numeric(input$ethnic1)]
      
      #       if (input$gender1 == "3" & input$ethnic1 == "2")
      #         out = aaply(out[,,,2], c(1,2),sum)
      #       
      #       if (input$gender1 == "3" & input$ethnic1 == "1")
      #         out = aaply(out[,,,1], c(1,2),sum)
      
      if (input$gender1 == "3" & input$ethnic1 != "3")
        out = aaply(out[,,,as.numeric(input$ethnic1)], c(1,2),sum) 
      
      if (input$gender1 == "3" & input$ethnic1 == "3")
        out = aaply(out,c(1,2), sum)
      
      #       if (input$gender1 == "2" & input$ethnic1 == "3")
      #         out = aaply(out[,,2,],c(1,2), sum)  
      #       
      #       if (input$gender1 == "1" & input$ethnic1 == "3")
      #         out = aaply(out[,,1,],c(1,2), sum)     
      
      if (input$gender1 != "3" & input$ethnic1 == "3")
        out = aaply(out[,,as.numeric(input$gender1),],c(1,2), sum)  
      
      out
    }
    else
      return(NULL)
    
  })
  
  output$testShow <- renderPrint({
    
    testShowCalc()
    
  })
  
  testShowCalc2 <- reactive({
    
    # key1
    # because est5year.array is putting Maori, Non-Maori, Total order
    # we now change to Non-Maori, Maori, Total order
    est5year.array = est5year.array[,,,c(2,1,3)]
    
    if (!is.null(input$gender1) && !is.null(input$ethnic1)){
      out = est5year.array[,,as.numeric(input$gender1), as.numeric(input$ethnic1)]
      out
    }
    else
      return(NULL)
    
  })
  
  output$testShow2 <- renderPrint({
    
    
    testShowCalc2()
    
  })
  
  testShowCalc3 <- reactive({
    
    if (!is.null(testShowCalc()) & !is.null(testShowCalc2())){
      mat1 <- testShowCalc()
      mat2 <- testShowCalc2()
      
      colSums(mat1/mat2 * refPop[,as.numeric(input$SELECTref)]) * 10^5 
      
    }
    else
      return(FALSE)
      
    
  })
  
  output$testShow3 <- renderPrint({
    
    
    testShowCalc3()
    
  })
  
})
