% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/photos_model.r
\name{photos_model}
\alias{photos_model}
\title{Photosynthesis model}
\usage{
photos_model(par, data, ColPhotos, ColH, ColVPD, ColTair, ColPair, ColQ,
  ColCa, ColUstar, ColWS, ColSW_in, Chi_o)
}
\arguments{
\item{par}{A vector containing optimal parameters (a1,Do,To,beta).}

\item{data}{Data.frame or matrix containing all required variables.}

\item{ColPhotos}{Column name of numeric vector containing time series of photosynthesis data (umol CO2 m-2 s-1).}

\item{ColH}{Column name of numeric vector containing time series of sensible heat flux (W m-2).}

\item{ColVPD}{Column name of numeric vector containing time series of vapor pressure deficit (hPa).}

\item{ColTair}{Column name of numeric vector containing time series of air temperature (deg C).}

\item{ColPair}{Column name of numeric vector containing time series of atmospheric pressure (kPa).}

\item{ColQ}{Column name of numeric vector containing time series of photosynthetic active radiation (umol m-2 s-1).}

\item{ColCa}{Column name of numeric vector containing time series of atmospheric CO2 concentration (umol Co2 mol air-1).}

\item{ColUstar}{Column name of numeric vector containing time series of wind friction velocity (m s-1).}

\item{ColWS}{Column name of numeric vector containing time series of wind velocity (m s-1).}

\item{ColSW_in}{Column name of numeric vector containing time series of incoming short-wave radiation (W m-2).}

\item{Chi_o}{Long-term effective chi.}
}
\value{
a numeric vector containing estimates of photosyntesis rates (umolCO2 m-2 s-1)
}
\description{
Modelling eddy covariance derived photosynthesis via diffusion of CO2 through stomata and plant optimization theory (see Perez-Priego et al., 2018).
}
\details{
The following metrics are calculated as:


         \deqn{Photos <- (gc_bulk*Ca*(1-Chi)}

         gc_bulk accounts for stomatal and aerodynamic effects.
         While chi is estimated using optimality theory as:

         \deqn{Chi <- (Chi_o*1/(1+beta*VPD^0.5)}
}
\note{
Model is constrained with estimates of Photos from the night-time NEE partitioning approach (Reichstein et al., 2005).
        chi is optimized following Perez-Priego et al., 2018.
}
\examples{
 ## Selecting a single day (e.g. 15-05-2011)
 tmp <-  EddySample[ EddySample$TIMESTAMP_START>  201105150000,]
 tmp <-  tmp[tmp$TIMESTAMP_START<  201105160000,]
 ## Defining parameter values
 par <- c(382, 0.05, 23, 0.62)

 photos_model(par = par
 ,data = tmp
 ,ColPhotos = "GPP_NT_VUT_MEAN"
 ,ColH = "H_F_MDS"
 ,ColVPD = "VPD_F"
 ,ColTair = "TA_F"
 ,ColPair = "PA_F"
 ,ColQ = "PPFD_IN"
 ,ColCa = "CO2_F_MDS"
 ,ColUstar = "USTAR"
 ,ColWS = "WS_F"
 ,ColSW_in = "SW_IN_F"
 ,Chi_o = 0.88
)
}
\references{
Perez-Priego, O., G. Katul, M. Reichstein et al. Partitioning eddy covariance
            water flux components using physiological and micrometeorological approaches,
            Journal of Geophysical Research: Biogeosciences. In press


            Reichstein, M., et al. (2005), On the separation of net ecosystem exchange
            into assimilation and ecosystem respiration: review and improved algorithm,
            Global Change Biology, 11(9), 1424-1439.
}
