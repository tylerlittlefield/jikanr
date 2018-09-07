#' Top items on MyAnimeList. Note: subtype returns a filtered top list of a type
#' item. For example, the top Anime (type) movies (subtype). Note2: subtype is
#' only for anime and manga types.
#'
#' @param type Top items of this type
#' @param page The Top page on MyAnimeList is paginated offers 50 items per page
#' @param subtype Refine the data using a subtype such as: \cr
#' Anime: airing, upcoming, tv, movie, ova, special. \cr
#' Manga: manga, novels, oneshots, doujin, manhwa, manhua, \cr
#' Both: bypopularity, favorite.
#'
#' @export
top <- function(type, subtype = NULL, page = 1) {

  url_string <- paste("https://api.jikan.moe/v3/top", type, page, subtype, sep = "/")
  response <- httr::GET(url_string)
  dat <- jsonlite::fromJSON(httr::content(response, type = "text", encoding = "UTF-8"))
  dat <- dat$top
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
# top <- function(type, subtype = NULL, page = 1) {
#
#   url_string <- paste("https://api.jikan.moe/v3/top", type, page, subtype, sep = "/")
#   response <- httr::GET(url_string)
#   dat <- rjson::fromJSON(httr::content(response, type = "text", encoding = "UTF-8"))
#   dat <- dat$top
#   dat <- do.call(rbind, dat)
#   dat <- as.data.frame(dat)
#   dat <- replace_nulls(dat, NA)
#   dat <- tibble::as_tibble(dat)
#
#   return(dat)
# }
