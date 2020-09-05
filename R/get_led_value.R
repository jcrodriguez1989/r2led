#' Get the value of a led instance.
#'
#' Gets the value of a given led instance.
#'
#' @param x A LED instance.
#'
#' @return A logical of length one with the actual value of the led.
#'
#' @examples
#' \dontrun{
#' # Get a led instance with initial value TRUE.
#' led <- get_led(14, TRUE)
#' # Read the value of the led (should be TRUE).
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
  as.logical(x@led$value)
})
