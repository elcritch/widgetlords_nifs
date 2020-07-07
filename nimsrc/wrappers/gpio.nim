const
  GPIO_HIGH* = 1
  GPIO_LOW* = 0
  GPIO_INPUT* = 1
  GPIO_OUTPUT* = 2
  GPIO_OPEN_DRAIN* = 4
  GPIO_OPEN_SOURCE* = 8

proc gpio_init*() {.cdecl, importc: "gpio_init", header: "gpio.h".}
proc gpio_configure*(pin: uint32_t; flags: uint8_t) {.cdecl,
    importc: "gpio_configure", header: "gpio.h".}
proc gpio_write*(pin: uint32_t; value: uint8_t) {.cdecl, importc: "gpio_write",
    header: "gpio.h".}
proc gpio_read*(pin: uint32_t): int8_t {.cdecl, importc: "gpio_read", header: "gpio.h".}

