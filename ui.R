
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(reshape)

shinyUI(fixedPage(

  # Application title
  tagList(
    tags$head(
      #     tags$script(src="less-1.7.0.js", type="text/javascript"),
      #     tags$link(href="C:/Users/jzen188/Desktop/temp/TEMP/www/variable.less", type="text/css"),
      #     tags$link(href="C:/Users/jzen188/Desktop/temp/TEMP/www/bootswatch.less", type="text/css"),
      tags$title("Mortality Rate Calculator")
    ), 
    #includeScript("www/less-1.7.0.js") ,
    h2(style = "padding: 10px 0px;", "Mortality Rate Calculator"),
    div(style = "padding: 20px 0px;", "The Mortality Calculator is an interactive tool for quick access to mortality information by age, sex, ethnicity, year, region and major causes of death.  Statistics are presented as graphs and tables.")
  ),
  
  
  fluidRow(
    column(width = 3,
           wellPanel(
             selectInput('SELECTpop', "Select populations you want", 
                         choices = c("Single Population" = 1,
                                     "2 Populations" = 2,
                                     "3 Populations" = 3,
                                     "4 Populations" = 4
                                     )
                         )
             )
    ),
    column(width = 3,
           wellPanel(
             selectInput('SELECTref', "Select Reference/Standard Population",
                         choices = c("Segi"=1, "WHO"=2, "Maori 2013"=3, "Maori 2006"=4, "Maori 2001"=5)
             )
           )
    ),
    column(width = 3,
           wellPanel(
             radioButtons('RRcal', "Relative Risk Caculated:", choices = c("yes","no"))
           )
    )
  ),
  fluidRow(
    column(width = 3,
           uiOutput('LISTpop1')
    ),
    column(width = 3,
           uiOutput('LISTpop2')
    ),
    column(width = 3,
           uiOutput('LISTpop3')
    ),
    column(width = 3,
           uiOutput('LISTpop4')
    )
  ), 
  fluidRow(
    column(width=6, offset = 2,
           verbatimTextOutput('testShow'),
           verbatimTextOutput('testShow2'),
           verbatimTextOutput('testShow3')
             
    )  
  )
))
