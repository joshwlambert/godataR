#' Check if the provided Go.Data URL is valid
#'
#' A function to check whether the provided URL
#' is valid. This is a housekeeping function
#' used in many of the other `godataR` functions.
#'
#' @param url Insert the base URL for your instance of Go.Data here. Don't forget the forward slash "/" at end!
#'
#' @return
#' Boolean, where `TRUE` indicates a valid URL.
#' @examples
#' \dontrun{
#' url <- "https://MyGoDataServer.com/"
#' check_godata_url(url=url)
#' }
#' @importFrom magrittr %>%
#' @import httr
#' @importFrom purrr pluck
#' @export
check_godata_url <- function(url=url) {

  # Get status code for version check
  status_code <- GET(paste0(url,"api/system-settings/version")) %>%
    pluck("status_code")

  # create boolean based on status code being 200 (success)
  check <- (status_code==200)

  return(check)

}
