# The ConfiguredLeds class contains a list of configured leds, this is to
# configure each led pin at most once. In `gpiozero` Python library, if
# configuring a led more than once, it throws an error.
ConfiguredLeds <- setRefClass(
  "ConfiguredLeds",
  fields = list(leds = "list")
)

#' @importFrom reticulate import
# @param pin A character or numeric of length one with the GPIO pin that the
#   led is connected to.
# @param initial_value A numeric of length one. If 0 (the default), the LED
#   will be off initially. Other values between 0 and 1 can be specified as an
#   initial brightness for the LED.
config_led <- function(pin, initial_value) {
  # Import the gpiozero Python library.
  gpiozero <- import("gpiozero")
  # Create the led Python instance.
  gpiozero$PWMLED(pin = as.integer(pin), initial_value = initial_value)
}

# Set ConfiguredLeds methods.
ConfiguredLeds$methods(
  # This function will configure the led if it does not exist, if it does
  # exist, it will return it.
  # @param pin A character or numeric of length one with the GPIO pin that the
  #   led is connected to.
  # @param initial_value A numeric of length one. If 0 (the default), the LED
  #   will be off initially. Other values between 0 and 1 can be specified as an
  #   initial brightness for the LED.
  #' @importFrom methods new
  get_led = function(pin, initial_value) {
    # Try to get the configured led.
    pin_name <- as.character(pin)
    led <- leds[[pin_name]]
    if (is.null(led)) {
      # The led was not configured, so do it.
      led_instance <- config_led(pin, initial_value)
      # Create our representation class of a led.
      led <- new("LED", pin = pin, led = led_instance)
      # Save the configured led.
      leds[[pin_name]] <<- led
    } else {
      # If it exists, move it to the provided initial_value.
      set_led_value(led, initial_value)
    }
    led
  }
)

# Create one empty ConfiguredLeds that will contain all the configured leds.
configured_leds <- ConfiguredLeds$new()
