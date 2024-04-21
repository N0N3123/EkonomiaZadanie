# Define the function
pkn <- function(symbol, tryb) {
  wybory <- c("kamień", "papier", "nożyce")
  if (tryb == "losowy") {
    wybor_komputera <- sample(wybory, 1)
  } else if (tryb == "zawsze wygrywana") {
    if (symbol == "kamień") {
      wybor_komputera <- "papier"
    } else if (symbol == "papier") {
      wybor_komputera <- "nożyce"
    } else {
      wybor_komputera <- "kamień"
    }
  } else if  (tryb == "zawsze przegrana") {
    if (symbol == "kamień") {
      wybor_komputera <- "nożyce"
    } else if (symbol == "papier") {
      wybor_komputera <- "kamień"
    } else {
      wybor_komputera <- "papier"
    }
  }
  Sys.sleep(2)
  if (symbol == wybor_komputera) {
    wynik <- "remis!"
  } else if ((symbol == "kamień" && wybor_komputera == "nożyce") ||
             (symbol == "papier" && wybor_komputera == "kamień") ||
             (symbol == "nożyce" && wybor_komputera == "papier")) {
    wynik <- "wygrałeś!"
  } else {
    wynik <- "przegrałeś!"
  }
  return(paste(symbol, "vs", wybor_komputera, "-", wynik))
}

print(pkn(symbol="nożyce", tryb="zawsze przegrana"))
