#' Set the value of a led instance.
#'
#' Sets the value of a given led instance.
#'
#' @param x A LED instance.
#' @param value A numeric of length one. If 0, the LED will be off. Other
#'  values between 0 and 1 can be specified as brightness for the LED.
#'
#' @return The same LED instance provided as input.
#'
#' @examples
#' \dontrun{
#' # Get a led instance.
#' led <- get_led(14)
#' # Turn the led to its maximum intensity.
#' set_led_value(led, 1)
#' # Turn the led off.
#' set_led_value(led, 0)
#' }
#'
#' @export
#'
setGeneric("set_led_value", function(x, value) standardGeneric("set_led_value"))

#' @describeIn set_led_value
#'
#' @export
#'
setMethod("set_led_value", "LED", function(x, value) {
  if (!(0 <= value && value <= 1))
    stop("`value` should be between 0 and 1")
  x@led$value <- value
  invisible(x)
})
