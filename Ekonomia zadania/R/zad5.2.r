dzielnik_liczby <- function(num) {
  dzielniki <- c()
  for (i in 1:num) {
    
    if (num %% i == 0) {
      dzielniki <- c(dzielniki, i)
    }
  }
  return(dzielniki)
}
print(dzielnik_liczby(26))