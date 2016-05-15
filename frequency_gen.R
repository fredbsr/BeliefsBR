setwd("C:/Users/Jamil/Downloads/programas/txt/psdb2002")
psdb2002 <- Corpus(DirSource())


corpus_clean <- tm_map(psdb2002, tolower)
corpus_clean <- tm_map(corpus_clean, removeNumbers)
corpus_clean <- tm_map(corpus_clean, removeWords, stopwords('portuguese'))
corpus_clean <- tm_map(corpus_clean, removePunctuation)
corpus_clean <- tm_map(corpus_clean, stripWhitespace)

#corpus_clean <- tm_map(corpus_clean, removeWords, c("jose serra"))
#corpus_clean <- tm_map(corpus_clean, removeWords, c("governo","nao","sera","politica","politicas","programa"))

psdb2002 <- tm_map(corpus_clean, PlainTextDocument)
dtm <- as.matrix(DocumentTermMatrix(psdb2002))
frequencyPSDB2002 <- sort(colSums(dtm), decreasing=TRUE)

writeCorpus(psdb2002, path = ".", filenames ="psdbalt2002.txt")


setwd("C:/Users/Jamil/Downloads/programas/txt/pt2002")
pt2002 <- Corpus(DirSource())


corpus_clean <- tm_map(pt2002, tolower)
corpus_clean <- tm_map(corpus_clean, removeNumbers)
corpus_clean <- tm_map(corpus_clean, removeWords, stopwords('portuguese'))
corpus_clean <- tm_map(corpus_clean, removePunctuation)
corpus_clean <- tm_map(corpus_clean, stripWhitespace)

#corpus_clean <- tm_map(corpus_clean, removeWords, c("resolucoes encontros congressos programas governo partido trabalhadores","wwwptorgbr","fundacao perseu abramo", "wwwfpabramoorgbr"))
#corpus_clean <- tm_map(corpus_clean, removeWords, c("governo","nao","sera","politica","politicas"))

pt2002 <- tm_map(corpus_clean, PlainTextDocument)

dtm <- as.matrix(DocumentTermMatrix(pt2002))
frequencyPT2002 <- sort(colSums(dtm), decreasing=TRUE)

writeCorpus(pt2002, path = ".", filenames ="ptalt2002.txt")

