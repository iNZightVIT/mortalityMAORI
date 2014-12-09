## After the DATA being update in the data file
## You should run this update script

# This one is mortality data
source("./prepare/creatDATA.R")

# This one is for estimated population and reference population
source("./prepare/creatEST.R")


## Cause the data size is more than a medium size 
## about 200000 rows and 13 columns.
## The analysis is highly depending on user options from UI
## So how to let the analysis being smooth is my prior concern here.
## I do serval steps in the ./prepare/creatDATA.R scripts.
## 1. Extract the columns we need
## 2. Simple data cleaning
## 3. transform the format to some good packages can recognise to use and rely them to provide a 
## good structure for analysis and its speed performance 
## (I use plry, reshape2, dplyr, data.table is also a good choice..)
## 4. after the above steps we can compress the data into 1.8 MB from 40.5MB. (of course, .RData <- .csv)


## Notice:
## 1. as far as I know the mortality data is not completed so you would expect a higher size data
## 2. The ethnic group (fromEuro, fromMaori, fromPacific, fromAsian), 
## Age (AGE: single-year/AGE_5bands: 5-years band) and Area code (TLA, DHB) in some sense
## not following independent rule in data design. However, I am using a strategy of
## first calculating all of them first here then do subset condition then transform to array
## matrix format for mortality rate calculation. This avoids everytime user changing
## option the shiny run some code to transform between them (such as TLA and DHB, they 
## actually pointing to the same thing but by doing this I can just do subset rather than
## load them all to transform between them, the same as ethnic group and age)
## You can use runApp() and play it to see how it works.
## 3. icda is the cause of mortality, this is still not completed and you should push
## Andrew for this. 
## 4. For the core calculation, check "testShowCalc3" in server.R

###  Update (December 10, 2014):
### 
###  1.  Requires new data.
###  2.  GUI needs to be as user-friendly as possible.
###  3.  PPT on project: https://iaos2014.gso.gov.vn/document/spor1.s1.v1.pptx
### 
