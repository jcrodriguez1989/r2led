r2led - R to LED
================

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Control your Raspberry Pi’s LED from R.

**Acknowledgments:** This package imports the
[gpiozero](https://gpiozero.readthedocs.io/) Python library.

## Installation

`r2led` is currently only available as a GitHub package.

To install it run the following from an R console:

``` r
if (!require("remotes")) {
  install.packages("remotes")
}
remotes::install_github("jcrodriguez1989/r2led", dependencies = TRUE)
```

## Prerequisites

### LED Connection

Please make sure that your LED is correctly connected to your Raspberry
Pi. Take note to which GPIO pin is your LED connected.

## Usage

In this example, the LED is connected to the GPIO14 pin:

``` r
# Load the library.
library("r2led")
# Get a led instance (by default, the initial value is 0, i.e. off).
led <- get_led(14)
# Read the actual LED's value (should be 0).
get_led_value(led)
# Turn it on (1 or TRUE).
set_led_value(led, TRUE)
```
