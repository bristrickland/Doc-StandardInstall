# Rprofile file to contain default things

.First <- function() {
  cat("\n   Welcome to R!\n")
  cat("Using .Rprofile in /home/longland/ \n\n")
}


outputps<-function(file="output.ps",width=6,height=6,...){
  dev.copy(postscript, file, 
           height=height, width=width, horizontal=F, onefile=F,...)
  dev.off()
}
outputpdf<-function(file="output.pdf",width=6,height=6,...){
  dev.copy(pdf, file, 
           height=height, width=width,...)
  dev.off()
}

myX11 <- function(...) 
{ 
    grDevices::X11(...) 
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0)) 
}

mypdf <- function(file="output.pdf",...)
  {
    grDevices::pdf(file=file,...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     
  }
mypng <- function(file="output.png",...)
  {
    grDevices::png(file=file,units="in",res=150,...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     
  }

myeps <- function(file="output.eps",...)
  {
    grDevices::postscript(file=file,onefile=F,...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     
  }
ploseps <- function(file="PLOSFig.eps",...)
  {
    grDevices::postscript(file=file,onefile=F,
                          family = "Arial", paper = "special",
                          horizontal = FALSE,
                          width = 6.83, height = 6, ...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     

  }
plostiff <- function(file="PLOSFig.tif",width=6.83,height=6,...)
  {
    grDevices::tiff(file=file,
                    family = "Arial", 
                    width = width, height = height, units='in',
                    type="cairo", res=300,
                    compression="lzw",...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     

  }
myceps <- function(file="output.eps",...)
  {
    grDevices::cairo_ps(file=file,onefile=F,...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     
  }
myxfig <- function(file="output.fig",...)
  {
    grDevices::xfig(file=file,...)
    par(cex.axis=1.3, cex.lab=1.5,   # Font sizes
        las=1,                       # Always horisontal text
        lwd=2,                       # Line width
        mar=c(5,5,3,2)+0.1,          # Margins
        pch=19,                      # Point type (solid circles)
        tcl=0.5,
        mgp=c(3,0.5,0))     
  }

axTexpr <- function(side, at = axTicks(side, axp=axp, usr=usr, log=log),
                    axp = NULL, usr = NULL, log = NULL, pad=FALSE,
                    pre=FALSE,dot=TRUE)
{
  ## Purpose: Do "a 10^k" labeling instead of "a e<k>"
  ##	      this auxiliary should return 'at' and 'label' (expression)
  ## -------------------------------------------------------------
  ## Arguments: as for axTicks()
  ##            pre determines if you should put the 3 in 3 \times 10^3
  ## --------------------------------------------------------------
  ## Author: Martin Maechler, Date:  7 May 2004, 18:01
  eT <- floor(log10(abs(at)))# at == 0 case is dealt with below
  mT <- at / 10^eT 
  if(pad){
    eT[sign(eT)>-1] <- paste("+",eT[sign(eT)>-1],sep="")
    temp <- eT[nchar(tmp)<3]
    eT[nchar(eT)<3] <- paste(substr(temp,1,1),"0",substr(temp,2,2),sep="")
  }
  ss <- lapply(seq(along = at),
               function(i) if(at[i] == 0) quote(0) else
               if(pre){
                 if(dot)substitute(A%.%10^E, list(A=mT[i], E=eT[i])) else
                 substitute(A%*%10^E, list(A=mT[i], E=eT[i]))
               }else{
                 substitute(10^E, list(A=mT[i], E=eT[i]))
               })
   do.call("expression", ss) 
}

## Expand a range by a given factor for plotting
exp.Range <- function(range,factor){

  c(range[1]-factor*(range[2]-range[1]),
    range[2]+factor*(range[2]-range[1]))

}

## Add an alpha value to a colour
add.alpha <- function(col, alpha=1){
  if(missing(col))
    stop("Please provide a vector of colours.")
  apply(sapply(col, col2rgb)/255, 2, 
                     function(x) 
                       rgb(x[1], x[2], x[3], alpha=alpha))  
}
