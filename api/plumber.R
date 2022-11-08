#* @apiTitle An unofficial API for lemonde.fr
#* @apiDescription Easily access information about lemonde.fr. This API was
#*     built for educational purposes.
#* @apiVersion 0.0.9000

library(plumber)
# library(swagger)
library(rapidoc)

#' @plumber
function(pr) {
  pr |>
    plumber::pr_set_docs("rapidoc",
                         header_color = "#000",
                         primary_color = "#036487")
}

#* Return the 9 most read headlines of lemonde.fr
#* @get /mostpopular
function() {
  now <- lubridate::now()
  url <- "https://www.lemonde.fr/"
  html <- rvest::read_html(url)

  html |>
    rvest::html_elements(".old__article-list-grid > a") |>
    purrr::imap_dfr(
      ~ tibble::tibble(
        rank = .y,
        headline = rvest::html_text(.x),
        url = rvest::html_attr(.x, "href"),
        `_scraped` = now
      )
    )
}
