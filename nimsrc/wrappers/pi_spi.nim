##  Define Pins as used by Pi-SPi modules

const
  DIR_RS485* = 25

##  SPI module channels

const
  SPI_8KO* = 0
  SPI_8AI* = 1
  SPI_2AO* = 2
  SPI_8DI* = 3
  SPI_SPARE1* = 4
  SPI_SPARE2* = 5
  SPI_SPARE3* = 6
  SPI_SPARE* = SPI_SPARE1

proc pi_spi_init*() {.cdecl, importc: "pi_spi_init", header: "pi_spi.h".}
const
  DEFAULT* = 0
  SPARE1* = 1
  SPARE2* = 2
  SPARE3* = 3
  OPTIONAL* = SPARE1

proc pi_spi_2ao_write_single*(channel: uint8; counts: uint16; ctype: uint8) {.
    cdecl, importc: "pi_spi_2ao_write_single", header: "pi_spi.h".}
proc pi_spi_8ai_read_single*(channel: uint8; ctype: uint8): uint16 {.cdecl,
    importc: "pi_spi_8ai_read_single", header: "pi_spi.h".}
proc pi_spi_8di_read*(address: uint8; ctype: uint8): uint8 {.cdecl,
    importc: "pi_spi_8di_read", header: "pi_spi.h".}
proc pi_spi_8di_read_single*(address: uint8; channel: uint8; ctype: uint8): uint8 {.
    cdecl, importc: "pi_spi_8di_read_single", header: "pi_spi.h".}
proc pi_spi_8di_init*(address: uint8; ctype: uint8) {.cdecl,
    importc: "pi_spi_8di_init", header: "pi_spi.h".}
proc pi_spi_8ko_write*(data: uint8; ctype: uint8) {.cdecl,
    importc: "pi_spi_8ko_write", header: "pi_spi.h".}
proc pi_spi_8ko_write_single*(channel: uint8; data: uint8; ctype: uint8) {.
    cdecl, importc: "pi_spi_8ko_write_single", header: "pi_spi.h".}
proc pi_spi_8ai_16b_set_channel*(channel: uint8; ctype: uint8) {.cdecl,
    importc: "pi_spi_8ai_16b_set_channel", header: "pi_spi.h".}
proc pi_spi_8ai_16b_read*(ctype: uint8): uint16 {.cdecl,
    importc: "pi_spi_8ai_16b_read", header: "pi_spi.h".}