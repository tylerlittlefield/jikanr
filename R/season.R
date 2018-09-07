#' Anime of the specified season and year
#'
#' @param year Specify the year.
#' @param season Specify the season: summer, spring, fall, winter.
#'
#' @export
season <- function(year, season) {

  url_string <- paste("https://api.jikan.moe/v3/season", year, season, sep = "/")
  response <- httr::GET(url_string)
  dat <- jsonlite::fromJSON(httr::content(response, type = "text", encoding = "UTF-8"), simplifyDataFrame = TRUE, flatten = TRUE)
  dat <- dat$anime
  dat <- tibble::as_tibble(dat)
  dat <- readr::type_convert(dat)

  return(dat)
}
