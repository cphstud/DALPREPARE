library(DBI)
library(RMariaDB)
library(Sentida)
library(textcat)

# Connect to the local shop database
conshop <- dbConnect(MariaDB(), 
                 db = "shop", 
                 host = "localhost", 
                 port = 3306,
                 user = "root",
                 password = "root123")

# OPG1: Connect to the WordPress database
conwp <- dbConnect(MariaDB(), 
                 db = "wordpress", 
                 host = "46.101.144.32", 
                 port = 3306,
                 user = "thor",
                 password = "OttoRehagel123")


# OPG2: Hent alle kommentarer
dfComments <- dbGetQuery("din forbindelse","din query")

# loop igennem og sæt en score
for (i in 1:length(dfComments[,2])) {
    score <- sentida("Intput fra kommentarfeltet")
    # add score to dataframe
}

# OPG Ekstra: Kig kun på danske indlæg
for (i in 1:length(dfComments[,2])) {
  lg <- textcat("Input fra kommentarfeltet")
  if (lg %in% c("norwegian","danish")) {
    score <- sentida("Intput fra kommentarfeltet")
  }
}

# OPG3: Brugerefternavn og email i en data-frame
query <- 'din query som du har bygget i WorkBench'
dfUsers <- dbGetQuery("din forbindelse til sql",query)

# OPG4: De 5 mest sælgende fra Shop
# I SQL:
# select e.firstname,e.lastname, sum(od.Quantity) as sum_total from 
# 
# where 
# and .. and 
# group by .. order by 3 desc limit 5;

# I R:
qStr2 <- c("hent ordre-detaljer")
qStr4 <- c("hent alle ordrer")
qStr6 <- c("hent all ansatte")
dfOD <- dbGetQuery(conshop,qStr2)
dfOrder <- dbGetQuery(conshop,qStr4)
dfEmpl <- dbGetQuery(conshop,qStr6)
dfAll <- merge()
dfAllEmp <- merge()
dfTop <- aggregate(dfAllEmp$Quantity, list(dfAllEmp$LastName), sum)
names(dfTop) <- c("name","max")
dfTopO <- dfTop[order(dfTop$max,decreasing = TRUE),]


# Ekstraopg: De 5 mest sælgende målt ud fra pris på varerne fra Shop

