rm(list=ls(all=TRUE))
cat("\014")
p <- ggplot(data = gc,
              mapping = aes(x = Duration,
                            y = `Credit amount`))
  p + geom_line()       
str(gc)
p <- ggplot(data = gc,
            mapping = aes(x = Duration,
                          y = `Credit amount`))
p + geom_line(mapping = 
                aes(group = Housing))

p <- ggplot(data = gc, mapping = aes(x = Duration, y = `Credit amount`))
p + geom_point(alpha = 0.2) + 
  facet_wrap(~ Risk + Housing)


gc.NA1 <- gc[complete.cases(gc$Risk & gc$Housing),]
gc.NA2 <- filter(gc,!is.na(Risk + Housing))

p.NA <- ggplot(data = gc.NA1, mapping = aes(x = Duration, y = `Credit amount`))
p.NA + geom_point(alpha = 0.2) + 
  facet_wrap( ~ Risk + Housing)

sum(is.na(gc.NA2$Risk&Housing))