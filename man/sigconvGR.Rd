\name{sigconvGR}
\Rdversion{1.1}
\alias{sigconvGR}
\title{convolve for Ground roll
}
\description{convolve a set of spikes
  for extended ground roll.  This is a special case of sigconv.
}
\usage{
sigconvGR(wigmat, wavepulse)
}
\arguments{
  \item{wigmat}{matrix of traces with spikes
}
  \item{wavepulse}{wavelet
}
}
\details{This is similar to the sigconv program but it
  assumes that the ground roll is extrened in time and space as the wave
  expands.
}
\value{Matrix, waveforms
}

\author{
Jonathan M. Lees<jonathan.lees@unc.edu>
}
\note{the program spreads the sinusoidal wavelet along a band to
  simulate ground-roll
  head wave noise.
}


\seealso{wiggleimage, symshot1, genrick, sigconv
}
\examples{



S1 <- symshot1()
dt <- S1$dt
###########    these are the reflections S1$GRrec

d <- dim(S1$smograms)
G1 <- matrix( rep(0, length=d[1]*d[2]), ncol=d[2], nrow=d[1])

###   these are the refractions S1$THEORY$trefrac
p <- round( S1$THEORY$trefrac[1,]/S1$dt );
G1[cbind(p , 1:d[2])  ] <- 1


#### plot the spikes
wiggleimage(0.1*G1, dt = -S1$dt, dx = S1$x, col = "black")

grlen <- floor(.6/dt)
fgr <- 10
tape <- applytaper( rep(1, grlen), p = 0.2)
tgr <- seq(from=0, by=dt, length=grlen)
siggr <- tape*sin(2*pi*fgr*tgr)

##############  convolve the wavelet with the set of spikes
H1 <- sigconvGR(G1, siggr)

############  plot
wiggleimage(0.1*H1, dt = -S1$dt, dx = S1$x, col = "black")









}
\keyword{misc}
