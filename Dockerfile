FROM rocker/r-ver

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libxml2-dev \
    libz-dev

COPY renv.lock renv.lock
RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::restore()"

COPY api/plumber.R api/plumber.R

EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('api/plumber.R'); pr$run(host = '0.0.0.0', port = 8000)"]
