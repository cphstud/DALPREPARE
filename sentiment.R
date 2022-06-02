library(dplyr)
library(Sentida)
library(stringr)
library(readr)
library(mongolite)
library(ggplot2)


# OPG1: Forbind til databasen "edc" og collection "vil7"
conedc <-mongo(
  url = "mongodb://46.101.144.32",
  verbose = TRUE
)

# OPG2: Hent vil7 ind i R og beregn sentida-scoren på 10 rækker

# OPG3: Beregn på alle og find de 10 mest positive og 10 mest negative
#       Plot score mod sqmprice


# Ekstraopgave: Find de rækker hvor prisen er landet i sqmprice og flyt til price
#               Beregn sqmprice




