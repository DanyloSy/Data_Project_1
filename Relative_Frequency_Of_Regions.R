set.seed(0870188)
# Extract the data from the excel spreadsheet via library “readxl”
library(readxl)
GreaterBoston = read_excel("/Users/danylos/Documents/R/GreaterBoston.xlsx")
# Generate a random sample of 250 objects with seed 0870188 from the data
Boston = GreaterBoston[sample.int(506,250,replace=F),]                   
# Relative frequency tells us how often certain values in a data occur
# relative to the total number of values
# The total number of values corresponds to variable "nval":
nval=length(Boston$REGION)
# To calculate the frequency of each value use the function "table", 
# assigned to variable "freq"
freq=table(Boston$REGION)
# All that is left to do is to find the relativity (divide one by another) # and assign it to variable "tables"
tables=(freq/nval)
# For better representation "decode" the district`s regions names and plot # on the x axis
reg=c("Northeast","Northwest","South","Centre")
q=c(tables)
# Assign extracted data to the data frame
df=data.frame(REGION=reg,RELATIVE_FREQUENCY=q)
print(df)
#Add values to the bottom of the bars and visualize via "barplot" function
xval=barplot(tables,
             xlab="Regions",
             ylab="Relative Frequency",
             main="",
             names=reg,
             col="cornflowerblue")
# For better representativeness add values corresponding to the relative
# frequencies onto the bars in the barplot via function “text” and 
# “as.matrix” that converts values from “data.table” to a matrix
y = as.matrix(tables)
text(xval,y=0.02,labels=as.character(y), col = "white")
