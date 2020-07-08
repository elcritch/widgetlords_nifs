const
  HEN* = 17
  DIR_RS485* = 25

type
  chip_enable* {.size: sizeof(cint).} = enum
    CE0 = 0, CE1 = 1, CE2 = 2, CE3 = 3, CE4 = 4


proc pi_spi_din_init*() {.cdecl, importc: "pi_spi_din_init", header: "pi_spi_din.h".}
proc pi_spi_din_4ao_init*() {.cdecl, importc: "pi_spi_din_4ao_init",
                            header: "pi_spi_din.h".}
proc pi_spi_din_4ao_write_single*(address: uint8; channel: uint8;
                                 counts: uint16) {.cdecl,
    importc: "pi_spi_din_4ao_write_single", header: "pi_spi_din.h".}
proc pi_spi_din_4ao_close*() {.cdecl, importc: "pi_spi_din_4ao_close",
                             header: "pi_spi_din.h".}
proc pi_spi_din_8ai_read_single*(ce: chip_enable; channel: uint8): uint16 {.cdecl,
    importc: "pi_spi_din_8ai_read_single", header: "pi_spi_din.h".}
proc pi_spi_din_8di_read*(ce: chip_enable; address: uint8): uint8 {.cdecl,
    importc: "pi_spi_din_8di_read", header: "pi_spi_din.h".}
proc pi_spi_din_8di_read_single*(ce: chip_enable; address: uint8; channel: uint8): uint8 {.
    cdecl, importc: "pi_spi_din_8di_read_single", header: "pi_spi_din.h".}
proc pi_spi_din_8di_init*(ce: chip_enable; address: uint8) {.cdecl,
    importc: "pi_spi_din_8di_init", header: "pi_spi_din.h".}
proc pi_spi_din_4ko_write*(ce: chip_enable; address: uint8; state: uint8) {.cdecl,
    importc: "pi_spi_din_4ko_write", header: "pi_spi_din.h".}
proc pi_spi_din_4ko_write_single*(ce: chip_enable; address: uint8;
                                 channel: uint8; state: uint8) {.cdecl,
    importc: "pi_spi_din_4ko_write_single", header: "pi_spi_din.h".}
proc pi_spi_din_4ko_init*(ce: chip_enable; address: uint8) {.cdecl,
    importc: "pi_spi_din_4ko_init", header: "pi_spi_din.h".}
proc pi_spi_din_4freq_read_fixed*(ce: chip_enable; address: uint8; channel: uint8): uint32 {.
    cdecl, importc: "pi_spi_din_4freq_read_fixed", header: "pi_spi_din.h".}
proc pi_spi_din_4freq_read_variable*(ce: chip_enable; address: uint8;
                                    channel: uint8): uint32 {.cdecl,
    importc: "pi_spi_din_4freq_read_variable", header: "pi_spi_din.h".}
proc pi_spi_din_4freq_read_pulse*(ce: chip_enable; address: uint8; channel: uint8): uint32 {.
    cdecl, importc: "pi_spi_din_4freq_read_pulse", header: "pi_spi_din.h".}
proc pi_spi_din_4freq_read_di*(ce: chip_enable; address: uint8): uint8 {.cdecl,
    importc: "pi_spi_din_4freq_read_di", header: "pi_spi_din.h".}
proc vpe_2901a_init*() {.cdecl, importc: "vpe_2901a_init", header: "pi_spi_din.h".}
proc vpe_2901a_2ao_write_single*(channel: uint8; counts: uint16) {.cdecl,
    importc: "vpe_2901a_2ao_write_single", header: "pi_spi_din.h".}
proc vpe_2901a_2ko_write_single*(channel: uint8; value: uint8) {.cdecl,
    importc: "vpe_2901a_2ko_write_single", header: "pi_spi_din.h".}
proc vpe_2901a_2di_read_single*(channel: uint8): uint8 {.cdecl,
    importc: "vpe_2901a_2di_read_single", header: "pi_spi_din.h".}
const
  VPE_2901A_SDAFE_1* = 6
  VPE_2901A_SDAFE_2* = 7

proc vpe_3011b_init*() {.cdecl, importc: "vpe_3011b_init", header: "pi_spi_din.h".}
proc vpe_3011b_4ko_write_single*(channel: uint8; value: uint8) {.cdecl,
    importc: "vpe_3011b_4ko_write_single", header: "pi_spi_din.h".}
proc vpe_3011b_8di_read*(): uint8 {.cdecl, importc: "vpe_3011b_8di_read",
                                   header: "pi_spi_din.h".}
proc vpe_3011b_8di_read_single*(channel: uint8): uint8 {.cdecl,
    importc: "vpe_3011b_8di_read_single", header: "pi_spi_din.h".}
const
  VPE_3011B_SDAFE_1* = 6
  VPE_3011B_SDAFE_2* = 7
  VPE_3011B_SDAFE_3* = 8
  VPE_3011B_SDAFE_4* = 9

## --------------------------------SDAFE---------------------------------

type
  sdafe_type* {.size: sizeof(cint).} = enum
    TYPE_1_MA = 1,              ##  Input 0 to 20 mA, Returns 0 to 20000, Scaler 1000
    TYPE_2_MA = 2,              ##  Input 0 to 20 mA, Returns 0 to 10000, Scaler 100
    TYPE_3_MA = 3,              ##  Input 4 to 20 mA, Returns 0 to 10000, Scaler 100 Note: Readings below 4 mA return as 0
    TYPE_4_5VDC = 4,            ##  Input 0 to 5 VDC, Returns 0 to 5000, Scaler 1000
    TYPE_5_5VDC = 5,            ##  Input 0 to 5 VDC, Returns 0 to 10000, Scaler 100
    TYPE_6_5VDC = 6,            ##  Input 1 to 5 VDC, Returns 0 to 10000, Scaler 100 Note: Readngs beluw 1 VDC return as 0
    TYPE_7_10VDC = 7,           ##  Input 0 to 10 VDC, Returns 0 to 10000, Scaler 1000
    TYPE_8_10VDC = 8,           ##  Input 0 to 10 VDC, Returns 0 to 10000, Scaler 100
    TYPE_9_10VDC = 9


type
  sdafe_status* {.size: sizeof(cint).} = enum
    SDAFE_OK = 0, SDAFE_POLARITY = 1, SDAFE_OVER_RANGE = 2, SDAFE_COMM_ERROR = 3


type
  sdafe_reading* {.importc: "sdafe_reading", header: "pi_spi_din.h", bycopy.} = object
    value* {.importc: "value".}: uint16
    status* {.importc: "status".}: sdafe_status
    counts* {.importc: "counts".}: uint16
    `type`* {.importc: "type".}: sdafe_type


proc sdafe_set_type*(channel: uint8; `type`: sdafe_type) {.cdecl,
    importc: "sdafe_set_type", header: "pi_spi_din.h".}
proc sdafe_read*(channel: uint8): sdafe_reading {.cdecl, importc: "sdafe_read",
    header: "pi_spi_din.h".}