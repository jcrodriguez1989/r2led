#' LED Class Representation.
#'
#' @slot pin The led's assigned pin.
#' @slot led The internal representation of the led.
#'
#' @importFrom methods setClass
#'
setClass(
  "LED",
  slots = c(
    # integer or character
    pin = "ANY",
    # gpiozero LED class
    led = "ANY"
  )
)
