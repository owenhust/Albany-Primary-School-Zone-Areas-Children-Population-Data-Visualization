#This is to plot the children population distriction in different areas in Albany Primary School Zone
install.packages(ggplot2)
library(ggplot2)
data <- read.csv('Albany Primary School Zone Summary.csv')

##plot the counts of population
ggplot(data, aes(factor(Year), Number)) + geom_bar(aes(fill = Age), stat = "identity", position = "dodge") +
  facet_wrap(~ Districts) + scale_x_discrete(labels = aes(Year)) + scale_y_continuous(sec.axis = sec_axis(~ . *1)) + 
  labs(title = "Children Population at Age 0 - 14 Distributed in The Districts of Albany Primary School Zone",
       subtitle = "Data in each district is grouped by pre-school and primary school age", x = "NZ Census Years", 
       y = "Population", caption = "based on data from NZ Stats, NZ Census in 2001, 2006 and 2013") + 
  theme(plot.title = element_text(size=24),text=element_text(size=22,  family="serif"),
        axis.text.x = element_text(face = "bold", size = 14), axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)))

##plot the percentage of the population
ggplot(data, aes(factor(Year), Percentage)) + geom_bar(aes(fill = Age), stat = "identity", position = "dodge")  +
  facet_wrap(~ Districts) + scale_x_discrete(labels = aes(Year)) + scale_y_continuous( sec.axis = sec_axis(~ ., labels = scales::percent),
                                                                                       labels = scales::percent) +  
  labs(title = "Percentage of Children Population at Age 0 - 14 Distributed in The Districts of Albany Primary School Zone", 
  subtitle = "Data in each district is grouped by pre-school and primary school age", x = "NZ Census Years", 
  y = "Population Percentage (%)", caption = "based on data from NZ Stats, NZ Census in 2001, 2006 and 2013") + 
  theme(plot.title = element_text(size=24),text=element_text(size=22,  family="serif"),
  axis.text.x = element_text(face = "bold", size = 14), axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)))