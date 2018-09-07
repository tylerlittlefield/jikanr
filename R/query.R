#' @title Query items on MyAnimeList.
#'
#' @description Search results for the query. NOTE: MyAnimeList only processes queries with a minimum of 3 letters.
#'
#' @param type Query items of this type: anime, manga, person, character.
#' @param query A string containing the query, example: "dragon ball".
#' @param page The page number on MyAnimeList is paginated, offers 50 items per page.
#'
#' @examples
#' query("manga", "berserk")
#'
#' @export
query <- function(type, query, page = 1) {

  if(nchar(query) < 3)
    {stop("type arg is < 3 characters. MyAnimeList only accepts queries with 3 or more characters.")}

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
