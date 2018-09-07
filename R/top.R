#' @title Top items on MyAnimeList
#'
#' @description
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
#' @example
#' top("anime", "tv")
#'
#' @export
top <- function(type, subtype = NULL, page = 1) {

  anime_subtypes <- c("airing", "upcoming", "tv", "movie", "ova", "special")
  manga_subtypes <- c("manga", "novels", "oneshots", "doujin", "manhwa", "manhua")

  if(is.null(subtype)) {subtype}
  else
  if(type == "anime" & subtype %in% manga_subtypes)
    {stop(subtype, " not available for anime, see ?top")}
  else
  if(type == "manga" & subtype %in% anime_subtypes)
    {stop(subtype, " not available for manga, see ?top")}

  url_string <- paste("https://api.jikan.moe/v3/top", type, page, subtype, sep = "/")
  response <- httr::GET(url_string)
  dat <- jsonlite::fromJSON(httr::content(response, type = "text", encoding = "UTF-8"))
  dat <- dat$top
  dat <- tibble::as_tibble(dat)
  dat <- readr::type_convert(dat)

  return(dat)
}
