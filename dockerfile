#FROM 318385233576.dkr.ecr.eu-central-1.amazonaws.com/aqprc-zero:latest
FROM rocker/r-ver:4.0.5

RUN apt-get update && apt-get install -y --no-install-recommends \
  libgit2-dev \
  libxml2-dev \
  libssl-dev \
  libz-dev \
  libcurl4-gnutls-dev \
  libsodium-dev \
  libcairo2-dev \
  libpq-dev \
  libssh2-1-dev


RUN mkdir /data

RUN mkdir /app
RUN chmod -R 755 /app

# COPY main
#ADD main.R .

# COPY package source
WORKDIR /app
ADD DESCRIPTION .
ADD NAMESPACE .
ADD R R
ADD man man
ADD main.R .

# install all deps
#RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cran.wu.ac.at/'))"
#RUN R -e "renv::restore()"


# buld pkg
RUN R CMD build .
RUN R -e "install.packages('"$(ls | grep add)"', repos = NULL, type = 'source')"

# Run script
CMD R -e  "source('main.R')"
