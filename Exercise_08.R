# Q1
game <- read.table("UWvMSU_1-22-13.txt")
game <- transform(game, V1 = as.numeric(as.character(V1)), V3 = as.numeric(V3))
score_UW <- game[game$V2=="UW",]
score_MSU <- game[game$V2=="MSU",]

s = 0
for (i in 1:nrow(score_UW)) {
  s <- s + as.integer(score_UW[i,"V3"])
  score_UW[i, "V3"] <- s
}

s = 0
for (i in 1:nrow(score_MSU)) {
  s <- s + as.integer(score_MSU[i,"V3"])
  score_MSU[i, "V3"] <- s
}

plot(append(0, score_UW$V1), append(0, score_UW$V3), type="l", col="black", axes=FALSE, frame.plot=TRUE, xlab=NA, ylab=NA, lwd=2, xlim=c(0,40), ylim=c(0,50))
lines(append(0, score_MSU$V1), append(0, score_MSU$V3), col="blue")
grid(nx = NULL, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)
axis(1, at=c(5,15,25,35), labels=c("1st", "2nd", "3rd", "4th"), tick=F)
axis(4, las=1, tick=F)


# Q2
print("I am thinking of a number 1-100...", quote=F)
x <- sample(1:100, 1)
for (i in 1:10) {
  g <- readline(prompt="Guess: ")
  if (g > x) {
    print("Lower", quote=F)
  }else if (g < x) {
    print("Higher", quote=F)
  }else {
    print("Correct!", quote=F)
    break
  }
}

