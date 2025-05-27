# funkcja liczy parametr y na podstawie zbioru danych x
# x - zbiór danych w postaci wektora liczbowego 
# funkcja sprawdza, czy zmienna jest typu numerycznego 
# Funkcja odporna na braki danych przy jednoczesnym dostępie do pozostałych argumentów funkcji mean. 

new_f <- function(x, ...){
  
  if (!is.numeric(x)) { stop("Obiekt wejściowy x nie jest typu numeric") }
  
  srednia <- mean(x,  ...)
  
  y <- srednia / 10 + sqrt(srednia) |> round(1)
  
  n <- sum(!is.na(x)) |> round(1)
  
  return(c(y = y, n = n))
  
}

# test 1 funkcji 

dane <- 1:10
new_f(x = dane)

# test 2 - sprawdzamy, czy odporna

new_f(x = letters)
letters |> str()

# test 3 NA

dane <- c(1:10, NA)
new_f(x = dane)               # źle 
new_f(x = dane, na.rm = T)    # poprawnie