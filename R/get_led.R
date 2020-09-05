#' Get a led instance.
#'
#' Returns a configured led instance.
#'
#' @param pin A character or numeric of length one with the GPIO pin that the
#'   led is connected to.
#' @param initial_value A logical of length one. If `FALSE` (the default), the
#'   LED will be off initially. If `NULL`, the LED will be left in whatever
#'   state the pin is found in when configured for output (warning: this can be
#'   on). If `TRUE`, the LED will be switched on initially.
#'
#' @return A LED S4 object, this object will be set to work with the
#'   configured led.
#'
#' @examples
#' \dontrun{
#' # Get a led instance connected at GPIO 14.
#' led_14 <- get_led(14)
#' # Get a led instance connected at GPIO 18.
#' led_18 <- get_led(18)
#' }
#'
#' @export
#'
get_led <- function(pin, initial_value = FALSE) {
  configured_leds$get_led(pin, initial_value)
}
