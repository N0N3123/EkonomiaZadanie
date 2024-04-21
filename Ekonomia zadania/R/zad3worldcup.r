if (!require(readxl)) install.packages('readxl')
#library(readxl)
mistrzostwa <- read_xlsx("WorldCupMatches.xlsx")
finals_with_italy <- mistrzostwa %>% filter(Stage == "Final" & (`Home Team Name` == "Italy" | `Away Team Name` == "Italy"))
print(nrow(finals_with_italy))
#Włochy były 6 razy w finale
#2
total_goals <- mistrzostwa$`Home Team Goals` + mistrzostwa$`Away Team Goals`
print(max(total_goals))
#Najwięcej było 12 goli
#3
city_counts <- table(mistrzostwa$City)
print(names(city_counts)[which.max(city_counts)])
#4
mean_viewers <- mean(mistrzostwa$Attendance, na.rm = TRUE)
print(mean_viewers)
#Średnia liczba widzów osiągnęła 45164.8
#5
matches <- mistrzostwa %>% filter((`Half-time Home Goals` > `Half-time Away Goals` & `Home Team Goals` < `Away Team Goals`) | 
                                   (`Half-time Home Goals` < `Half-time Away Goals` & `Home Team Goals` > `Away Team Goals`))
print(nrow(matches))
#Było 38 takich meczy