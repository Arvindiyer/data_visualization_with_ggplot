###############
# Author  - Arvind Iyer
# Title   - Data Preparation and Introduction to ggplot2
# Description   - Script for Day-1
##############

library(tidyverse)
# Read the data
Salaries <- read_csv(file = 'data/Salaries.csv')

# Help functions
help("read_csv")
?read_csv


Salaries_v2 <- read_csv(file = 'data/Salaries.csv',skip = 10)

# First lets get a glimpse of the data
glimpse(Salaries)

# Use select function to select rank and discipline columns
subset <- Salaries %>% select(rank,discipline)
subset

# Use mutate to create a new column color using discipline where A:red and B:blue  
subset<- subset %>% mutate(color=ifelse(discipline=='A','red','blue'))

#Use count function to count ranks
Salaries %>% count(rank)

#Summary of iris data
summary(iris)

# A scatter plot with ggplot on iris dataset
ggplot(iris,
       aes(x=Sepal.Length, y=Sepal.Width, 
           color=Species)) +
  geom_point() +
  scale_color_brewer(palette="Dark2") +
  stat_summary(fun="mean", geom= "line") + 
  facet_wrap(~Species) +
  theme_bw() + theme(legend.position="top") +
  annotate("text", x=7.5, y=2.5, label="Pval")+
  coord_flip()

# Bar plot on subset data
ggplot(Salaries)
ggplot(data = Salaries, mapping = aes(x=rank,fill = rank,colour = rank))
ggplot(data = Salaries, mapping = aes(x=rank,fill = rank,colour = rank))+
      geom_bar()
ggplot(data = Salaries, mapping = aes(x=rank,fill = rank,colour = rank))+
  geom_bar()+
  scale_fill_brewer(palette="Dark2")
ggplot(data = Salaries, mapping = aes(x=rank,fill = rank,colour = rank))+
  geom_bar()+
  scale_fill_brewer(palette="Dark2")+
  scale_color_brewer(palette="Dark2")

ggplot(data = Salaries, mapping = aes(x=rank,fill = rank,colour = rank))+
  geom_bar()+
  scale_fill_brewer(palette="Dark2")+
  scale_color_brewer(palette="Dark2")+
  theme_bw() + 
  theme(legend.position="top") 
