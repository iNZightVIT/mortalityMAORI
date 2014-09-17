est = read.csv("../data/Total and Maori pop est by single year.csv", 
               header=TRUE, check.names = FALSE, stringsAsFactors = FALSE)

# first, extract all ages data frame out
id1 = est$'Age.Group' == "All ages"
est.All = est[id1,]

est = est[!id1,]

# second, create 5-years array
est5year = est
sc = foo1(factor(est$Age.Group, unique(est$Age.Group)))
est5year$Age.Group = factor(rep(sc, 9), unique(sc))

m3 =  aggregate(.~Age.Group+Ethnicity+Gender, est5year,sum)
library(reshape2)

est5year.array = acast(melt(m3, id=c("Ethnicity", "Gender","Age.Group")),
                       Age.Group~variable~Gender~Ethnicity)
# > dimnames(est5year.array)
# [[1]]
# [1] "[0-4]"   "[10-14]" "[15-19]" "[20-24]" "[25-29]" "[30-34]" "[35-39]" "[40-44]" "[45-49]" "[5-9]"  
# [11] "[50-54]" "[55-59]" "[60-64]" "[65-69]" "[70-74]" "[75-79]" "[80-84]" "85+"    
# 
# [[2]]
# [1] "1991" "1992" "1993" "1994" "1995" "1996" "1997" "1998" "1999" "2000" "2001" "2002" "2003" "2004"
# [15] "2005" "2006" "2007" "2008" "2009" "2010" "2011" "2012" "2013"
# 
# [[3]]
# [1] "Female" "Male"   "Total" 
# 
# [[4]]
# [1] "Maori"     "Non-Maori" "Total" 
est$Age.Group = factor(est$Age.Group, levels = unique(est$Age.Group))
est1year.array = acast(melt(est, id=c("Ethnicity", "Gender","Age.Group")),
                       Age.Group~variable~Gender~Ethnicity)
# > dimnames(est1year.array)
# [[1]]
# [1] "0"   "1"   "2"   "3"   "4"   "5"   "6"   "7"   "8"   "9"   "10"  "11"  "12"  "13"  "14"  "15" 
# [17] "16"  "17"  "18"  "19"  "20"  "21"  "22"  "23"  "24"  "25"  "26"  "27"  "28"  "29"  "30"  "31" 
# [33] "32"  "33"  "34"  "35"  "36"  "37"  "38"  "39"  "40"  "41"  "42"  "43"  "44"  "45"  "46"  "47" 
# [49] "48"  "49"  "50"  "51"  "52"  "53"  "54"  "55"  "56"  "57"  "58"  "59"  "60"  "61"  "62"  "63" 
# [65] "64"  "65"  "66"  "67"  "68"  "69"  "70"  "71"  "72"  "73"  "74"  "75"  "76"  "77"  "78"  "79" 
# [81] "80"  "81"  "82"  "83"  "84"  "85"  "86"  "87"  "88"  "89"  "90+"
# 
# [[2]]
# [1] "1991" "1992" "1993" "1994" "1995" "1996" "1997" "1998" "1999" "2000" "2001" "2002" "2003" "2004"
# [15] "2005" "2006" "2007" "2008" "2009" "2010" "2011" "2012" "2013"
# 
# [[3]]
# [1] "Female" "Male"   "Total" 
# 
# [[4]]
# [1] "Maori"     "Non-Maori" "Total" 

# final, we create est all age array
estAllAge.array = acast(melt(est.All, id=c("Ethnicity", "Gender","Age.Group")),
                       Age.Group~variable~Gender~Ethnicity)

save(est1year.array,est5year.array,estAllAge.array, file = "estPop.RData")


# This will create population reference
refPop <- read.csv(".data/PopulationRef.csv",header=TRUE, row.names=1)
refPop <- refPop[-19,]
refPop <- as.matrix(refPop/colSums(refPop)) 

save(refPop, file = "refPop.RData")
