#Installing of package
install.packages("syuzhet")

#Loading of the package
library(syuzhet)

#Get the data from text file 
text <- readLines("resp.txt")
text

#Fetch sentiment score from text
Sentiment <- get_nrc_sentiment(text)
View(Sentiment)

#Total count of each sentiment in entire data
TotalSentiment <- data.frame(colSums(Sentiment))
View(TotalSentiment)
names(TotalSentiment) <- "count"
View(TotalSentiment)

#Restructuring analysis in structured format
TotalSentiment <- cbind("sentiment" = rownames(TotalSentiment), TotalSentiment)
rownames(TotalSentiment) <- NULL
View(TotalSentiment)

#Installing package
install.packages("ggplot2")
library(ggplot2)

#Plotting bar graph with visualization of sentiment score
ggplot(data = TotalSentiment, aes(x = sentiment, y = count))+
  geom_col(aes(fill= sentiment))+ geom_text(aes(label= count))+
  xlab("Sentiment") + ylab("Total Count") + ggtitle("Total Sentiment Score")
