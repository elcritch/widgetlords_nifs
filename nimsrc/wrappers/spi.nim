proc spi_open*(channel: uint8_t; speed: uint32_t) {.cdecl, importc: "spi_open",
    header: "spi.h".}
proc spi_transfer*(data: ptr uint8_t; len: uint32_t) {.cdecl, importc: "spi_transfer",
    header: "spi.h".}