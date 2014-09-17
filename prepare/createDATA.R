


## loading data
# this only contains data from 1989 - 1997
dat4 <- read.csv("../data/mortality.csv",header=TRUE)



## Data Cleaning
# remove Gender == "U"
dat4 <- subset(dat4, Gender!="U")
dat4$Gender <- droplevels(dat4$Gender)


## two variable adding to provide index functionality
library(plyr)


## a dangerous step may be also provide the first 
temp2.15 <- mutate(dat4, Year = substr(as.character(dod), 7, 10), 
                  fromEuro = c(0,1)[1+as.integer(ETHNICITY_1 %in% c("European NFD", "NZ European / Pakeha", "Other European") | ETHNICITY_2 %in% c("European NFD", "NZ European / Pakeha", "Other European") | ETHNICITY_3 %in% c("European NFD", "NZ European / Pakeha", "Other European"))],
                  fromMaori = c(0,1)[1+as.integer(ETHNICITY_1 %in% "Maori" | ETHNICITY_2 %in% "Maori" | ETHNICITY_3 %in% "Maori")],
                  fromPacific = c(0,1)[1+as.integer(ETHNICITY_1 %in% c("Pacific Island NFD", "Samoan", "Cook Island Maori", "Tongan", "Niuean", "Tokelauan", "Fijian", "Other Pacific Island") | ETHNICITY_2 %in% c("Pacific Island NFD", "Samoan", "Cook Island Maori", "Tongan", "Niuean", "Tokelauan", "Fijian", "Other Pacific Island") | ETHNICITY_3 %in% c("Pacific Island NFD", "Samoan", "Cook Island Maori", "Tongan", "Niuean", "Tokelauan", "Fijian", "Other Pacific Island"))],
                  fromAsian = c(0,1)[1+as.integer(ETHNICITY_1 %in% c("Asian NFD", "Southeast Asian", "Chinese", "Indian", "Other Asian") | ETHNICITY_2 %in% c("Asian NFD", "Southeast Asian", "Chinese", "Indian", "Other Asian") | ETHNICITY_3 %in% c("Asian NFD", "Southeast Asian", "Chinese", "Indian", "Other Asian"))],
                  fromOther = c(0,1)[1+as.integer(ETHNICITY_1 %in% c("Middle Eastern", "Latin American / Hispanic", "African", "Other") | ETHNICITY_2 %in% c("Middle Eastern", "Latin American / Hispanic", "African", "Other") | ETHNICITY_3 %in% c("Middle Eastern", "Latin American / Hispanic", "African", "Other"))],
# this is actually nothing if data is from 1989-1997 # fromOther2 = c(0,1)[1+as.integer(ETHNICITY_1 %in% "Other Ethnicity" | ETHNICITY_2 %in% "Other Ethnicity" | ETHNICITY_3 %in% "Other Ethnicity")],
                  fromNotStated = c(0,1)[1+as.integer(ETHNICITY_1 %in% "Not stated" & ETHNICITY_2 %in% "Not stated" & ETHNICITY_3 %in% "Not stated")] ,  # three columns should be Not stated counting into not stated.
                  dom = as.character(formatC(Domicile_Code, flag=0, digit=3)),
                  count = 1   # a value to count for success observation and for compress
)

# change dom's "  NA" back to NA
temp2.15[which(is.na(temp2.15$Domicile_Code)),"dom"]<-NA

## domicile code transformation
dom_code <- read.csv("../domicile.csv", header= TRUE)

dom_code$TLA = formatC(dom_code$TLA, digits=2, flag="0")
dom_code$DHB.area = formatC(dom_code$DHB.area, digits=2, flag="0")
#dom_code$dom = formatC(as.character(dom_code$dom), digits=3, flag="0")

## ???
temp2.15$TLA = as.factor(dom_code$TLA[match(as.numeric(temp2.15$dom), as.numeric(dom_code$dom))])
temp2.15$DHB = as.factor(dom_code$DHB.area[match(as.numeric(temp2.15$dom), as.numeric(dom_code$dom))])


# set Year greater than 1988
temp2.15.5 = subset(temp2.15, as.numeric(Year) >= 1988)

# Here we need a data with single age scale
# set maximal age is 90+
temp2.15.6 = mutate(temp2.15.5, AGE = pmin(Age_at_Death_Years,90))
temp2.15.6 = mutate(temp2.15.6, AGE = factor(AGE, levels=sort(unique(temp2.15.6$AGE))))
levels(temp2.15.6$AGE)[levels(temp2.15.6$AGE)=="90"] <- "90+"


temppp <- temp2.15.6[,c(2,26,38:44,47:49)]
## short to 5 year band, now we get [0-4],[5-9] to match estimated population
temppp <- mutate(temppp, AGE_5bands = foo2(AGE), Year = as.numeric(as.character(Year)))
save(temppp, file="temppp.RData")
# no missing value
# > nrow(temppp)
# [1] 275913
# > nrow(na.omit(temppp))
# [1] 275913


