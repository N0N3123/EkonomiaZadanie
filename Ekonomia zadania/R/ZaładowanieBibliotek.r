
install.packages("HSAUR3")
install.packages("T4cluster")

library(HSAUR3)
library(T4cluster)

data("household", package = "HSAUR3")
data("household", package = "T4cluster")
print(household)