library(gapminder)
library(tidyverse)
library(socviz)
view(gapminder)
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p
p + geom_point() 
p + geom_smooth()
p + geom_point() + geom_smooth() 
p + geom_point(alpha=0.2) + geom_smooth(method = "lm") + scale_x_log10() + 
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()
p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
p + geom_point(mapping = aes(color = continent)) +
  geom_smooth(method = "loess") +
  scale_x_log10
p + geom_point(mapping = aes(color = log(pop))) +
  scale_x_log10()  
p <- ggplot(data = gapminder,
            mapping = aes(x = year,
                          y = gdpPercap))
p + geom_line()
p <- ggplot(data = gapminder,
            mapping = aes(x = year,
                          y = gdpPercap))
p + geom_line(mapping = 
                aes(group = country))
p <- ggplot(data = gapminder,
            mapping = aes(x = year,
                          y = gdpPercap))

p + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ continent)      
africa.df <- gapminder[gapminder$continent == "Africa",]
p.africa <- ggplot(data = africa.df,
                   mapping = aes(x = year,
                                 y = gdpPercap))

p.africa + geom_line(mapping = aes(group = country)) 
p + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ country)   

p.africa + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ country)   
p + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ continent, ncol = 5)   

p.africa + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ country, ncol = 13)  
p + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ continent, nrow = 5)   
p + geom_line(mapping = aes(group = country)) + 
  facet_wrap(~ continent, ncol = 5)   
p + geom_line(color="gray70", mapping=aes(group = country)) +
  geom_smooth(size = 1.1, method = "loess", se = FALSE) +
  scale_y_log10(labels=scales::dollar) +
  facet_wrap(~ continent, ncol = 5) +
  labs(x = "Year",
       y = "log GDP per capita",
       title = "GDP per capita on Five Continents")   
gss_sm <- gss_sm
View(gss_sm)
head(gss_sm)
str(gss_sm)
p <- ggplot(data = gss_sm, mapping = aes(x = age, y = childs))
p + geom_point()
p + geom_point() + facet_grid(sex ~ race)
p + geom_point(alpha = 0.2) + 
  geom_smooth() +
  facet_grid(sex ~ race)
owid_covid_data <- read_csv("owid-covid-data.csv")
View(owid_covid_data)
str(owid_covid_data)
length(owid_covid_data)
length(owid_covid_data$iso_code)
t(t(names(owid_covid_data)))
categories <- c(-10,0,10,20,30,40,50,60,70,80,90,100)
owid_covid_data$s_bucket <- cut(owid_covid_data$stringency_index, categories)
summary(owid_covid_data$s_bucket)