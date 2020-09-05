#' Set the value of a led instance.
#'
#' Sets the value of a given led instance.
#'
#' @param x A LED instance.
#' @param value  A logical of length one. If `FALSE`, the LED will be switched
#'   off. If `TRUE`, the LED will be switched on.
#'
#' @return The same LED instance provided as input.
#'
#' @examples
#' \dontrun{
#' # Get a led instance.
#' led <- get_led(14)
#' # Turn the led on.
#' set_led_value(led, TRUE)
#' # Turn the led off.
#' set_led_value(led, FALSE)
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
  if (!(identical(value, TRUE) || identical(value, FALSE)))
    stop("`value` should be TRUE or FALSE")
  x@led$value <- as.integer(value)
  invisible(x)
})
