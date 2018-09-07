#' Query items on MyAnimeList.
#'
#' @param type Top items of this type.
#' @param query A string containing the query, example: "dragon ball".
#' @param page The Top page on MyAnimeList is paginated offers 50 items per page.
#'
#' @export
query <- function(type, query, page = 1) {

  query <- gsub(" ", "%20", query)
  query <- paste0("?q=", query, "&page=", page)
  url_string <- paste("https://api.jikan.moe/v3/search", type, query, sep = "/")
  response <- httr::GET(url_string)
  dat <- jsonlite::fromJSON(httr::content(response, type = "text", encoding = "UTF-8"), simplifyDataFrame = TRUE)
  dat <- dat$results
  dat <- tibble::as_tibble(dat)
  dat <- readr::type_convert(dat)

  return(dat)
}

# Old method, rjson
#
# replace_nulls <- function(dat, replacement) {
#   apply(dat, 2, function(y) sapply(y, function(x) ifelse(is.null(x), replacement, x)))
# }
#
# query <- function(type, query, page = 1) {
#
#   query <- gsub(" ", "%20", query)
#   query <- paste0("?q=", query, "&page=", page)
#   url_string <- paste("https://api.jikan.moe/v3/search", type, query, sep = "/")
#   top_url <- url_string
#   response <- httr::GET(top_url)
#   dat <- rjson::fromJSON(httr::content(response, type = "text", encoding = "UTF-8"))
#   dat <- dat$results
#   dat <- do.call(rbind, dat)
#   dat <- as.data.frame(dat)
#   dat <- replace_nulls(dat, NA)
#   dat <- tibble::as_tibble(dat)
#   dat <- readr::type_convert(dat)
#
#   return(dat)
# }
