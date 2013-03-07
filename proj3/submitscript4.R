checkPkgs <- function() {
        pkg.inst <- installed.packages()
        pkgs <- c("RCurl", "digest")
        have.pkg <- pkgs %in% rownames(pkg.inst)

        if(any(!have.pkg)) {
                cat("Some packages need to be installed\n")
                r <- readline("Install necessary packages [y/n]? ")
                if(tolower(r) == "y") {
                        need <- pkgs[!have.pkg]
                        message("installing packages ",
                                paste(need, collapse = ", "))
                        install.packages(need)
                }
        }
}

checkPkgs()

CLASS <- "compdata-002"
challenge.url <- paste("http://class.coursera.org", CLASS,
                       "assignment/challenge", sep = "/")
submit.url <- paste("http://class.coursera.org", CLASS,
                       "assignment/submit", sep = "/")

loginPrompt <- function() {
        email <- readline("Submission login (email): ")
        passwd <- readline("Submission  password: ")
        r <- list(email = email, passwd = passwd)
        assign(".CourseraLogin", r, globalenv())
        invisible(r)
}

submit <- function(manual = FALSE, resetLogin = FALSE) {
        library(RCurl)
        library(digest)
        if(!manual) {
                if(exists(".CourseraLogin") && !resetLogin)
                        cred <- get(".CourseraLogin")
                else
                        cred <- loginPrompt()
                if(!is.list(cred) || !(names(cred) %in% c("email", "passwd")))
                        stop("problem with login/password")
                email <- cred$email
                password <- cred$passwd
        }
        ## Prompt Submission Part
        sid <- partPrompt()

        ## Get output
        output <- getOutput(sid)

        if(!manual) {
                ## Get challenge
                ch <- getChallenge(email)
                
                ## Attempt submission with challenge
                ch.resp <- challengeResponse(password, ch$ch.key)
                results <- submitSolution(email, ch.resp, sid, output, ch$state)
                if(!length(results))
                        results <- "Incorrect!"
                cat("Result: ", results, "\n")
        }
        else {
                outfile <- paste(sid, "output.txt", sep = "-")
                writeLines(as.character(output), outfile)
                cat(sprintf("Please upload the file '%s' to Coursera\n",
                            outfile))
        }
        invisible()
}

getOutput <- function(sid) {
        ## sid <- sub("-dev", "", sid, fixed = TRUE)
        if(sid == "count-1") {
                source("count.R", local = TRUE)
                cat("Running test:\n")
                cat("count(\"shooting\")\n")
                count("shooting")
        }
        else if(sid == "count-2") {
                source("count.R", local = TRUE)
                cat("Running test:\n")
                cat("count(\"asphyxiation\")\n")
                count("asphyxiation")
        }
        else if(sid == "count-3") {
                source("count.R", local = TRUE)
                cat("Running test:\n")
                cat("count(\"stabbing\")\n")
                count("stabbing")
        }
        else if(sid == "age-1") {
                source("agecount.R", local = TRUE)
                cat("Running test:\n")
                cat("agecount(45)\n")
                agecount(45)
        }
        else if(sid == "age-2") {
                source("agecount.R", local = TRUE)
                cat("Running test:\n")
                cat("agecount(87)\n")
                agecount(87)
        }
        else {
                stop("invalid part number")
        }
}

partPrompt <- function() {
        sid <- c("count-1",
                 "count-2",
                 "count-3",
                 "age-1",
                 "age-2"
                 )
        ## JUST FOR TESTING
        ## sid <- paste(sid, "dev", sep = "-")
        
        sidname <- c("'count' part 1",
                     "'count' part 2",
                     "'count' part 3",
                     "'agecount' part 1",
                     "'agecount' part 2"
                     )
        numparts <- length(sid)
        cat(paste(paste("[", seq_len(numparts), "]", sep = ""), sidname),
            sep = "\n")
        partnum <- readline(sprintf("Which part are you submitting [1-%d]? ",
                                    numparts))
        partnum <- as.integer(partnum)
        if(is.na(partnum))
                stop("please specify part number")
        if(partnum > numparts)
                stop("invalid part number")
        sid[partnum]
}

getChallenge <- function(email) {
        params <- list(email_address = email, response_encoding = "delim")
        result <- getForm(challenge.url, .params = params)
        s <- strsplit(result, "|", fixed = TRUE)[[1]]
        list(ch.key = s[5], state = s[7])
}

challengeResponse <- function(password, ch.key) {
        x <- paste(ch.key, password, sep = "")
        digest(x, algo = "sha1", serialize = FALSE)
}

submitSolution <- function(email, ch.resp, sid, output, signature, src = "",
                           http.version = NULL) {
        output <- as.character(base64(output))
        src <- as.character(base64(src))
        params <- list(assignment_part_sid = sid,
                       email_address = email,
                       submission = output,
                       submission_aux = src,
                       challenge_response = ch.resp,
                       state = signature)
        params <- lapply(params, URLencode)
        result <- postForm(submit.url, .params = params)
        s <- strsplit(result, "\\r\\n")[[1]]
        tail(s, 1)
}
