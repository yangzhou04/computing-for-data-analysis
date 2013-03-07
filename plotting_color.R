## grDevices
#  colorRamp()
#  colorRampPlatte()

# colors()
# gray()

pal <- colorRamp(c('red', 'blue'))
class(pal) #-#: [1] "function"
pal(0)
#-#:      [,1] [,2] [,3]      Red  Green Blue
#-#: [1,]  255    0    0
pal(1)
#-#:     [,1] [,2] [,3]
#-# [1,]    0    0  255
pal(0.5)
#-#:       [,1] [,2]  [,3]
#-#: [1,] 127.5    0 127.5

#
pal(seq(0, 1, len=10))
#_#:            [,1] [,2]      [,3]
#_#:  [1,] 255.00000    0   0.00000
#_#:  [2,] 226.66667    0  28.33333
#_#:  [3,] 198.33333    0  56.66667
#_#:  [4,] 170.00000    0  85.00000
#_#:  [5,] 141.66667    0 113.33333
#_#:  [6,] 113.33333    0 141.66667
#_#:  [7,]  85.00000    0 170.00000
#_#:  [8,]  56.66667    0 198.33333
#_#:  [9,]  28.33333    0 226.66667
#_#: [10,]   0.00000    0 255.00000

pal <- colorRampPalette(c('red', 'yellow'))
pal(2)
#-#: [1] "#FF0000" "#FFFF00"  #from red to yellow
pal(10)
#-#: [1] "#FF0000" "#FF1C00" "#FF3800" "#FF5500" "#FF7100" "#FF8D00" "#FFAA00" "#FFC600"
#-#: [9] "#FFE200" "#FFFF00"


### RColorBrewer Package: containing useful palettes
## There are 3 types of palettes
# Sequential   color ordered from low to high
# Diverging    seperate to different direction
# Qualitative   represent data that are not ordered

library(RColorBrewer)
cols <- brewer.pal(3, 'BuGn')
pal <- colorRampPalette(cols)
image(volcano, col=pal(20))

# smoothScatter()
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)

## rgb(): produce color via combining of r,g,b. 
# transparency, alpha parameter

## colorspace package
x <- rnorm(1000)
y <- rnorm(1000)
plot(x, y, col=rgb(0,0,0,0.2), pch=19)

