#' Get the value of a led instance.
#'
#' Gets the value of a given led instance.
#'
#' @param x A LED instance.
#'
#' @return A numeric of length one with the actual value of the led.
#'
#' @examples
#' \dontrun{
#' # Get a led instance with initial value 1 (maximum intensity).
#' led <- get_led(14, 1)
#' # Read the value of the led (should be 1).
#' get_led_value(led)
#' }
#'
#' @export
#'
setGeneric("get_led_value", function(x) standardGeneric("get_led_value"))

#' @describeIn get_led_value
#'
#' @export
#'
setMethod("get_led_value", "LED", function(x) {
  x@led$value
})
