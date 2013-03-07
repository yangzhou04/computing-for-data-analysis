## related packages
#  graphics : 'base' graphical system
#  lattice : producing Trellis graphics, independent of 'base' graphical system
#  grid : another 'base' graphical system
#  grDevices : work with various graphics devices. X11, PDF, PostScript, xfig...

### What device will plot be sent?
# Unix: X11, Windows: windows, MAC OS X: quartz


### Graphic systems generally cannot be mixed

## par function is used to specify global graphics parameters that affect all 
#  R plots in a session
# pch: the plotting symbol
# lty: the line type: solid line, dashed , dotted etc.
# lwd: the line width
# col: color
# las: the orientation of the axis labels on the plot
# bg: background color
# mar: margin size
# oma: outer margin size
# mfrow: number of plots per row, column(plots are filled row-wise)
# mfcol: number of plots per row, column(plots are filled column-wise)

# check default value
> par('lty')
#-#: [1] "solid"
> par('lwd')
#-#: [1] 1
> par('col')
#-#: [1] "black"
> par('pch')
#-#: [1] 1    #open circle
par('mar')
#-#: [1] 5.1 4.1 4.1 2.1    buttom left up right
par('mfrow')
#-#: [1] 1 1  # a single plot

## cp a plot
#  dev.copy: cp a plot from one device to another
#  dev.copy2pdf
#  dev.list: show the list of open graphic devices
#  dev.next: switch control to the next device
#  dev.set:  set control to the device
#  dev.off: close the current device


## The base plotting paradigm
#  important functions:
#  plot
#  lines
#  points
#  text
#  title
#  mtext: add arbitrary text to margin
#  axis


## The lattice plotting paradigm
##  important functions
# xyplot: main function for creating scatterplots
# bwplot: box-and-whisks plots
# histogram: plot histogram
# stripplot: like a bwplot but with actual points
# dotplot: plot dots on "violin strings"
# splom: scatterplot matrix
# levelplot, contourplot: plot "image" data

## xyplot
#first arg is a  formula.e.g.: y ~ x | f * g  # lattice can plot conditional variable
#second arg is a data frame.
# if no data frame or list is passed, then the parent frame is used

# lattice diff. from base in one critical way:
# base graphics functions plot data directly to the device (side effect)
# latttice return an object of trellis
# the print methods for lattice functions do the work of plotting data on device


## lattice functions have a penal function which controls what happened inside
#    each panel of entire plot
# plot y vs x conditioned on f
library(lattice)
# package description
package ?lattice
x <- rnorm(100)
y <- x + rnorm(100)
f <- gl(2, 50, labels=c('Group1', 'Group2'))
xyplot(y~x | f)
# custom panel function
xyplot(y~x | f, 
       panel=function(x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.abline(h=median(y), 
                      lty=2)
         # panel.lmline(x, y, col=2) # add a regression line
       })






