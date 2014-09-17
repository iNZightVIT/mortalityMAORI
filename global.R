load("~/Desktop/Andrew App/analysis/temppp.RData")
load("~/Desktop/Andrew App/analysis/estPop.RData")
load("~/Desktop/Andrew App/analysis/refPop.RData")

check.Inconsistent <- function(data){
  
  # after the whole data transformation some function will eventually change the row names
  # we should check this after we modify the data frame cause we don't want to lose row number 
  # to make sure it is consistent to the original
  
  sum(diff(as.numeric(rownames(data)))>1)
}

# this is for estimated data
foo1 <- function(x, bin = 5, condition = "85") {
  
  # x: would be our Age.Group variable
  # bin: would be the length of year range
  # condition: would be the special care for the last group like we can set 85+, 86+
  label <- levels(x)
  len <- nlevels(x)
  # check condition
  end.id <- which(label %in% condition)
  len.end <- (as.integer(condition)+1) : len
  label.end <- label[len.end] <- paste0(condition,"+")
  #label.end <- label[as.integer(condition) : len] 
  label <- label[-len.end]
  len <- len - length(len.end)
  start = seq(1, len, bin)
  end = seq(bin, len, bin)
  intervel = paste0("[",label[start], "-", label[end], "]")
  c(rep(intervel, each=bin, length.out = len), 
    rep(label.end, length.out = length(len.end)))
}

# this if for mortality data
foo2 <- function(x, bin = 5, condition = 85) {
  
  # x: would be our Age.Group variable
  # bin: would be the length of year range
  # condition: would be the special care for the last group like we can set 85+, 86+
  new.x = as.numeric(x) - 1
  new.x = pmin(new.x, condition)
  bin.x = new.x %/% bin
  lower = sort(unique(bin.x)) * bin
  upper = sort(unique(bin.x)) * bin + (bin - 1)
  labels = paste0("[", lower, "-", upper,"]")
  out = factor(bin.x, levels = sort(unique(bin.x)), labels = labels) 
  levels(out)[length(levels(out))] <- paste0(condition, "+")
  out
}

## intersect Year of temppp and pop Est
id0 = intersect(names(table(temppp$Year)),dimnames(est5year.array)[[2]])
temppp2 = subset(temppp, Year >= min(as.numeric(id0)) & Year<= max(as.numeric(id0))) # NOTICE one should combine with droplevel() here
est5year.array = est5year.array[,id0,,]
est1year.array = est1year.array[,id0,,]
# if estAllAge.array for calculation we subset it by 
# estAllAge.array[,id0, con1, con2]
