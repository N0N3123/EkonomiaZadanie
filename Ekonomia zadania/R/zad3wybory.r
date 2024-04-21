if (!require(readxl)) install.packages('readxl')
library(readxl)
wybory <- read_xlsx("wybory.xlsx")
over_80 <- sum(wybory$Frekwencja > 80)
print(over_80)
#1189

#2
poznan_count <- sum(wybory$Gmina == "m. Poznań")
print(poznan_count)
#3
miasto_count <- sum(wybory$`Typ obszaru` == "miasto")
print(miasto_count)
#12538 w mieście
wies_count <- sum(wybory$`Typ obszaru` == "wieś")
print(wies_count)
#13661 we wsiach
#4
mean_attendance <- aggregate(wybory$Frekwencja ~ wybory$Województwo, FUN = mean)
print(mean_attendance)
#1   dolnośląskie          65.17095
#2   kujawsko-pomorskie          63.75662
#3            lubelskie          64.76517
#4             lubuskie          63.27143
#5              łódzkie          68.72844
#6          małopolskie          69.62191
#7          mazowieckie          71.95434
#8             opolskie          59.04372
#9         podkarpackie          65.81185
#10           podlaskie          63.21738
#11           pomorskie          67.00187
#12             śląskie          66.05347
#13      świętokrzyskie          65.54740
#14 warmińsko-mazurskie          59.92234
#15       wielkopolskie          67.53694
#16  zachodniopomorskie          63.74362
#5
difference <- abs(wybory$`Rafał Kazimierz TRZASKOWSKI` - wybory$`Andrzej Sebastian DUDA`)
max_difference <- max(difference, na.rm = TRUE)
print(max_difference)
#100
