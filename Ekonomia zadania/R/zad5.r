paradoks_urodzin <- function(liczba_ludzi, powtorzenia = 100000) {
  dni <- 1:31
  miesiace <- 1:12
  duplikaty <- replicate(powtorzenia, {
    daty_urodzen <- paste0(sample(miesiace, liczba_ludzi, replace = TRUE), "-", sample(dni, liczba_ludzi, replace = TRUE))
    any(duplicated(daty_urodzen))
  })
  prawdopodobienstwo_duplikatu <- mean(duplikaty)
  return(prawdopodobienstwo_duplikatu)
}
print(paradoks_urodzin(23))