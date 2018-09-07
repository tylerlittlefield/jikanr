# jikanr [![Travis build status](https://travis-ci.org/tyluRp/jikanr.svg?branch=master)](https://travis-ci.org/tyluRp/jikanr)
R Interface to Jikan API

## Installation

```r
# install.packages("devtools")
devtools::install_github("tylurp/jikanr")
```

## Usage

There are 4 functions: `top`, `query`, `schedule`, and `season`:

#### `top(type, subtype, page)`

* type: anime, manga, people, characters
* subtype: 
  * Anime: airing upcoming tv movie ova special 
  * Manga: manga novels oneshots doujin manhwa manhua 
  * Both: bypopularity favorite
* page: page number, interger value that defaults to 1

#### `query(type, query, page)`

* type: anime, manga, person, character
* query: a string, for example, "dragon ball"
* page: page number, interger value that defaults to 1

#### `schedule(day)`

* day: monday, tuesday, wednesday, thursday, friday, saturday, sunday. Defaults to NULL and pulls data from all days of the week and returns a list.

#### `season(year, season)`

* year: a year value, for example, 1999
* season: spring, summer, winter, fall.

## Demo

Grab the top 50 anime using `top`:

```r
jikanr::top("anime")

# A tibble: 50 x 11
   mal_id  rank title      url              image_url                 type  episodes start_date end_date members score
 *  <int> <int> <chr>      <chr>            <chr>                     <chr>    <int> <chr>      <chr>      <int> <dbl>
 1   5114     1 Fullmetal… https://myanime… https://myanimelist.cdn-… TV          64 Apr 2009   Jul 2010 1254891  9.25
 2  32281     2 Kimi no N… https://myanime… https://myanimelist.cdn-… Movie        1 Aug 2016   Aug 2016  792763  9.17
 3  28977     3 Gintama°   https://myanime… https://myanimelist.cdn-… TV          51 Apr 2015   Mar 2016  211571  9.14
 4   9253     4 Steins;Ga… https://myanime… https://myanimelist.cdn-… TV          24 Apr 2011   Sep 2011 1059138  9.14
 5  11061     5 Hunter x … https://myanime… https://myanimelist.cdn-… TV         148 Oct 2011   Sep 2014  764086  9.11
 6   9969     6 Gintama'   https://myanime… https://myanimelist.cdn-… TV          51 Apr 2011   Mar 2012  225071  9.1 
 7    820     7 Ginga Eiy… https://myanime… https://myanimelist.cdn-… OVA        110 Jan 1988   Mar 1997  132863  9.08
 8  35180     8 3-gatsu n… https://myanime… https://myanimelist.cdn-… TV          22 Oct 2017   Mar 2018  100971  9.06
 9  15417     9 Gintama':… https://myanime… https://myanimelist.cdn-… TV          13 Oct 2012   Mar 2013  130359  9.06
10  28851    10 Koe no Ka… https://myanime… https://myanimelist.cdn-… Movie        1 Sep 2016   Sep 2016  564689  9.04
# ... with 40 more rows
```

Search for anime or manga using `query`:

```r
jikanr::query("manga", "dragon ball")

# A tibble: 50 x 13
   mal_id url   image_url title publishing synopsis type  chapters volumes score start_date         
 *  <int> <chr> <chr>     <chr> <lgl>      <chr>    <chr>    <int>   <int> <dbl> <dttm>             
 1     42 http… https://… Drag… FALSE      Dragon … Manga      520      42  8.52 1984-11-20 00:00:00
 2  86671 http… https://… "Dra… FALSE      Short a… Manga        3       0  6.98 2015-02-21 00:00:00
 3  89734 http… https://… Drag… TRUE       Reuniti… Manga        0       0  7.6  2015-06-20 00:00:00
 4  26373 http… https://… Drag… FALSE      Dragon … Manga        3       1  7.02 2011-06-21 00:00:00
 5  54627 http… https://… Ging… FALSE      Retired… Manga       12       1  7.26 2013-07-13 00:00:00
 6  16110 http… https://… Drag… FALSE      Two str… Manga        0       2  7.19 2009-03-21 00:00:00
 7 103047 http… https://… Drag… FALSE      A Japan… Manga        5       1  7.3  2016-12-12 00:00:00
 8  23446 http… https://… Drag… TRUE       The mis… Manga        0       0  6.89 2010-12-03 00:00:00
 9  43401 http… https://… Drag… TRUE       This ma… Manga        0       0  7.03 2012-09-21 00:00:00
10   1297 http… https://… Iryu… FALSE      Dr. Kat… Manga      210      25  8.19 2002-11-01 00:00:00
# ... with 40 more rows, and 2 more variables: end_date <dttm>, members <int>
```
