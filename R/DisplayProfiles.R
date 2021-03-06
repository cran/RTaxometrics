DisplayProfiles <-
function(CCFIs, parameters) {
  # 
  # Plots CCFI profiles.
  #
  # Args:
  #        CCFIs: CCFI values across base rates and procedures (matrix).
  #   parameters: Data and program parameters (list).
  #
  # Returns:
  #   Nothing; graphical output.
  #
  if (parameters$graph == 1) {
    dev.new(height = 4.5, width = 6)
  }
  if (parameters$graph == 2) {
  	jpeg(paste("RunCCFIProfile ", date(), ".jpeg", sep = ""), units = "in", 
  	     height = 4.5, width = 6, res = 500, quality = 50)
  }
  if (parameters$graph == 3) {
  	tiff(paste("RunCCFIProfile ", date(), ".tiff", sep = ""), units = "in", 
  	     height = 4.5, width = 6, res = 500)
  }
  xs <- seq(parameters$min.p, parameters$max.p, length = parameters$num.p)
  plot(x = xs, CCFIs[5, ], ylim = c(0, 1), type = "p", pch = 20, 
       main = "CCFI Profiles", xlab = "Taxon Base Rate", ylab = "CCFI", 
       cex.main = .75, cex.axis = .75, cex.lab = .75)
  lines(xs, CCFIs[5, ], lty = 1, lwd = 2)
  abline(h = .5, lty = 3)
  if (parameters$MAMBAC) {
    points(xs, CCFIs[1, ], pch = 77, cex = .5)
    lines(xs, CCFIs[1, ], lty = 2)
  }
  if (parameters$MAXEIG) {
    points(xs, CCFIs[2, ], pch = 88, cex = .5)
    lines(xs, CCFIs[2, ], lty = 3)
  }
  if (parameters$LMode) {
    points(xs, CCFIs[3, ], pch = 76, cex = .5)
    lines(xs, CCFIs[3, ], lty = 4)
  }
  if (parameters$MAXSLOPE) {
    points(xs, CCFIs[4, ], pch = 83, cex = .5)
    lines(xs, CCFIs[4, ], lty = 5)
  }
  if (parameters$graph == 2) {
    cat("\nSaving graph to .jpeg file\n")
    dev.off()
  }
  if (parameters$graph == 3) {
    cat("\nSaving graph to .tiff file\n")
    dev.off()
  }
}
