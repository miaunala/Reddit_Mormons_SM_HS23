library(ggplot2)
library(tidyverse)

sub_christianity_lds <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
sub_christianity_mormons <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

sub_politics_lds <- c(0, 3, 1, 0, 1, 1, 2, 6, 5, 2, 0, 1, 0)
sub_politics_mormons <-c(125, 110, 58, 99, 80, 52, 101, 196, 195, 242, 109, 21, 10)

sub_worldnews_lds <- c(0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0)
sub_worldnews_mormons <- c(2, 10, 4, 1, 4, 6, 3, 4, 4, 2, 3, 4, 1)

sub_data <- c(sub_christianity_lds, sub_christianity_mormons, sub_politics_lds,
              sub_politics_mormons, sub_worldnews_lds, sub_worldnews_mormons)

month <- c("Jan 2012", "Feb 2012", "Mar 2012", "Apr 2012", "May 2012", "Jun 2012", 
           "Jul 2012", "Aug 2012", "Sep 2012", "Oct 2012","Nov 2012", "Dec 2012", 
           "Jan 2013")

# Create a data frame with the given data
data <- data.frame(
  month = rep(month, times = 6),
  variable = rep(c("sub_christianity_lds", "sub_christianity_mormons", "sub_politics_lds",
                   "sub_politics_mormons", "sub_worldnews_lds", "sub_worldnews_mormons"), each = 13),
  count = c(sub_christianity_lds, sub_christianity_mormons, sub_politics_lds,
            sub_politics_mormons, sub_worldnews_lds, sub_worldnews_mormons)
)
data$month <- factor(data$month, levels = month)

# Create the ggplot
ggplot(data, aes(x = month, y = count, color = variable, group = variable)) +
  geom_line() +
  geom_point() +
  labs(title = "Monthly Counts of Mormon/LDS related Submissions",
       x = "Month",
       y = "Count",
       color = "Variable") +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 90))

ggsave("submission_count.jpg")

###################################################################
# Comments

com_christianity_lds <- c(0,0,0,0,0,0,0,0,0,0,0,0,0)
com_christianity_mormons <- c(0,0,0,0,0,0,0,0,0,0,0,0,0)

com_politics_lds <- c(32,14,7,18,17,12,18,27,53,43,18,7,3)
com_politics_mormons <- c(1924,1003,565,913,966,662,1472,2422,3142,3250,1680,352,321)

com_worldnews_lds <- c(1,1,2,0,1,0,1,1,2,1,1,12,1)
com_worldnews_mormons <- c(43,63,51,29,69,56,49,92,175,136,137,639,98)


com_data <- c(com_christianity_lds, com_christianity_mormons, com_politics_lds,
              com_politics_mormons, com_worldnews_lds, com_worldnews_mormons)


data_com <- data.frame(
  month = rep(month, times = 6),
  variable = rep(c("com_christianity_lds", "com_christianity_mormons", "com_politics_lds",
                   "com_politics_mormons", "com_worldnews_lds", "com_worldnews_mormons"), each = 13),
  count = c(com_christianity_lds, com_christianity_mormons, com_politics_lds,
            com_politics_mormons, com_worldnews_lds, com_worldnews_mormons)
)
data_com$month <- factor(data_com$month, levels = month)

# Create the ggplot
ggplot(data_com, aes(x = month, y = count, color = variable, group = variable)) +
  geom_line() +
  geom_point() +
  labs(title = "Monthly Counts of Mormon/LDS related Comments",
       x = "Month",
       y = "Count",
       color = "Variable") +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 90))

ggsave("comment_count.jpg")
