# R: Basic Codes
# In this blog, I will share a basic set of R commands and codes that will be helpful to start working with R. These are easily available online, and this blog is just a small step to consolidate the important codes in one place. If someone really wants to learn R, it is recommended to browse through coursera and edx.
# In this post, we will go through the following commands:

# Reading Data in R
# List of columns in a dataset
# Different joins in R
# If conditions and multiple if conditions
# Appending two dataset
# Group by command
# Finding distinct values in a vector


# 1. Reading Data in R
SampleData <- read.csv('C:/Users/Desktop/Sample_R_Data.csv',header = TRUE,dec=".")
SampleData1 <- read.table('C:/Users/Desktop/Sample_R_Data.csv',sep=",",header = TRUE,dec=".")

# 2. List of columns in the dataset
colnames(SampleData)
colist <- colnames(SampleData)

data1 <- subset(SampleData, select=c("cust_i", "y_var"))
data2 <- SampleData[,c(2,3,4)]
data2_1 <- SampleData[c("cust_i", "y_var")]
data3 <- SampleData[1:10,c(2,3,4)]

# 3. Joins in R
 data_LeftJoin <- merge(x = data1, y = data2, by = "cust_i", all.x = TRUE)
data_RightJOin <- merge(x = data1, y = data2, by = "cust_i", all.y = TRUE)
data_OuterJoin <- merge(x = data1, y = data2, by = "cust_i", all = TRUE)
data_CrossJoin <- merge(x = data1, y = data2, by = NULL)
data_InnerJoin <- merge(x = data1, y = data3, by = "cust_i")

# 4a. If conditions
data4 <- subset(SampleData, y_var==1)
data5 <- SampleData[SampleData$y_var==0,]
# install.packages("sqldf")
library(sqldf)
data6 <- sqldf("select * from SampleData where y_var==1")

# 4b. Multiple If condition (SUBSET is inefficient)
data7 <- subset(SampleData, y_var==1 & SampleData <= 300)
data8 <- SampleData[SampleData$y_var==0 & SampleData$str_trnx_gap <= 300,]
data9 <- SampleData[SampleData$y_var==0 | SampleData$str_trnx_gap <= 300,1:4]

# 5. Append
data10 <- rbind(data4,data5)

# 6. Group By Summary Statistics in R
# Using TABLE or AGGREGATE or TAPPLY
# Note the use of USER_DEFINED function

table(SampleData$y_var, responseName= "sum")
data.frame(table(SampleData$y_var))

aggregate(SampleData$cust_i, by=list(Category=SampleData$y_var), FUN=function(x){NROW(x)})

tapply(SampleData$y_var, SampleData$y_var, FUN=function(x){NROW(x)})
tapply(SampleData$y_var, SampleData$y_var, FUN=function(x){NROW(x)/NROW(SampleData)})

# 7. Get distinct values of a vector
unique(SampleData$y_var)
