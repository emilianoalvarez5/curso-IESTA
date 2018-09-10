library(magrittr)
## anidamos el subset, el aggregate y la transformación
res=transform(aggregate(.~cyl,
                        data = subset(mtcars, hp>100,
                                      select=c('mpg','cyl')),
                        FUN=function(x) round(mean(x), 2)),
              kpl=mpg*0.4251)

## o generamos variables auxiliares 
xx1=subset(mtcars, hp>100, select=c('mpg','cyl'))
xx2=aggregate(.~cyl,data = xx1,FUN=function(x) round(mean(x), 2))
res2=transform(xx2, kpl=mpg*0.4251)

## para hacerlo con pipe ->
res3 = mtcars %>%
  subset(hp>100, select=c('mpg','cyl')) %>%
  aggregate(.~cyl,data = . ,FUN=function(x) round(mean(x), 2)) %>%
  transform(kpl=mpg*0.4251)
