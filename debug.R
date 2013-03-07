printmsg <- function(x) {
  if (is.na(x)) {
    print('x is a missing value')
  }
  
  # do something
  invisible(x) # still return the same object, but won't auto print
    #  the warning msg will not print too
}

## Debugging tools in R: functions  
# print and cat

# traceback: prints out the function call stack after the error occured.
mean(noexsit)
#-#: Error in mean(noexsit) : object 'noexsit' not found
traceback()
#-#: 1: mean(noexsit)



# debug: 'debug' modes allow you step through code line by line.
debug(printmsg) # put printmsg to debug mode, next you invoke printmsg, debug starts
## in debug mode
# n for next
# c for continue

undebug(printmsg) # execution mode.


# browser: suspends the execution of a function wherever it is called and puts 
#             the function in debug mode.

# trace: allows you to insert debugging code into a function a specific place

# recover: allows you to modify the error bahavior so you can check the function
#                 call stack.
#!!!  error handler
options(error=recover) # set error mode to recover
read.csv('nosuchfile')
