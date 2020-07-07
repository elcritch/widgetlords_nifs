const
  GPIO_HIGH* = 1
  GPIO_LOW* = 0
  GPIO_INPUT* = 1
  GPIO_OUTPUT* = 2
  GPIO_OPEN_DRAIN* = 4
  GPIO_OPEN_SOURCE* = 8

  ERR_GPIO_PIN_INVALID* = -1
  ERR_GPIO_FILE_DESCRIPTOR* = -2 
  ERR_GPIO_CHIP_INFO* =  -3
  ERR_GPIO_PIN_LINEHANDLE* = -4
  ERR_GPIO_PIN_NUMBER_INVALID* = -5


proc gpio_init*(): int8 {.cdecl, importc: "gpio_init", header: "gpio.h".}
proc gpio_configure*(pin: uint32; flags: uint8): int8 {.cdecl,
    importc: "gpio_configure", header: "gpio.h".}
proc gpio_write*(pin: uint32; value: uint8): int8 {.cdecl, importc: "gpio_write",
    header: "gpio.h".}
proc gpio_read*(pin: uint32): int8 {.cdecl, importc: "gpio_read", header: "gpio.h".}

