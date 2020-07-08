import nimler/nimler
import nimler/nimler/codec

import wrappers/gpio as gpio
import wrappers/pi_spi as pi_spi

using
  env: ptr ErlNifEnv
  argc: cint
  argv: ErlNifArgs

let ArgumentErrorAtom = ErlAtom(val: "argument_error")

template withPacked(body: untyped) =
  try:
    body
  except UnpackError:
    return env.to_term( (AtomError, ArgumentErrorAtom,) )

func add_numbers(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let a1 = env.from_term(argv[0], int32).get()
    let a2 = env.from_term(argv[1], int32).get()
    let r = a1 + a2
    return env.to_term(r)


func gpio_init(env; argc; argv): ErlNifTerm {.nif(arity=0), raises: [].} =
  withPacked():
    let err = gpio.gpio_init()

    if err >=  0:
      return env.to_term(AtomOk)
    else:
      return env.to_term( (AtomError, err,) )

func gpio_configure(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let pin: uint32 = env.from_term(argv[0], uint32).get()
    let flags: uint8 = env.from_term(argv[1], uint32).get().uint8
    let err = gpio.gpio_configure(pin, flags)

    if err >=  0:
      return env.to_term(AtomOk)
    else:
      return env.to_term( (AtomError, err,) )

func gpio_read(env; argc; argv): ErlNifTerm {.nif(arity=1), raises: [].} =
  withPacked():
    let pin: uint32 = env.from_term(argv[0], uint32).get()
    let err = gpio.gpio_read(pin)

    if err >=  0:
      return env.to_term(AtomOk)
    else:
      return env.to_term( (AtomError, err,) )

func pi_spi_init(env; argc; argv): ErlNifTerm {.nif(arity=0), raises: [].} =
  withPacked():
    pi_spi.pi_spi_init()
    return env.to_term(AtomOk)

func pi_spi_2ao_write_single(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    let counts = env.from_term(argv[0], uint32).get().uint16
    let ctype = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_2ao_write_single(channel, counts, ctype)

    return env.to_term(AtomOk)

func pi_spi_8ai_read_single(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    let res = pi_spi.pi_spi_8ai_read_single(channel, ctype)

    return env.to_term( (AtomOk, res.int) )

func pi_spi_8di_read(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let address = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    let res = pi_spi.pi_spi_8di_read(address, ctype) 

    return env.to_term( (AtomOk, res.int) )

func pi_spi_8di_read_single(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    let res = pi_spi.pi_spi_8di_read_single(address, channel, ctype) 

    return env.to_term( (AtomOk, res.int) )

func pi_spi_8di_init(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let address = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_8di_init(address, ctype) 

  return env.to_term( AtomOk )

func pi_spi_8ko_write(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let data = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_8ko_write(data, ctype) 

    return env.to_term( AtomOk )

func pi_spi_8ko_write_single(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    let data = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_8ko_write_single(channel, data, ctype) 

    return env.to_term( AtomOk )

func pi_spi_8ai_16b_set_channel(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    let ctype = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_8ai_16b_set_channel(channel, ctype) 

    return env.to_term( AtomOk )

func pi_spi_8ai_16b_read(env; argc; argv): ErlNifTerm {.nif(arity=1), raises: [].} =
  withPacked():
    let ctype = env.from_term(argv[0], uint32).get().uint8
    let res = pi_spi.pi_spi_8ai_16b_read(ctype) 

    return env.to_term( (AtomOk, res.int) )

func pi_spi_8ai_16b_read(env; argc; argv): ErlNifTerm {.nif(arity=1), raises: [].} =
  withPacked():
    let ctype = env.from_term(argv[0], uint32).get().uint8
    let res = pi_spi.pi_spi_8ai_16b_read(ctype) 
    return env.to_term( (AtomOk, res.int) )


# ======================================================================= #
# PI_SPI_DIN
# ======================================================================= #
func pi_spi_din_init(env; argc; argv): ErlNifTerm {.nif(arity=0), raises: [].} =
  withPacked():
    pi_spi.pi_spi_din_init() 
    return env.to_term( AtomOk )

func pi_spi_din_4ao_init(env; argc; argv): ErlNifTerm {.nif(arity=0), raises: [].} =
  withPacked():
    pi_spi.pi_spi_din_4ao_init() 
    return env.to_term( AtomOk )

func pi_spi_din_4ao_write_single(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let addres = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    let counts = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4ao_write_single(address, channel, counts) 

    return env.to_term( AtomOk )

func pi_spi_din_4ao_close(env; argc; argv): ErlNifTerm {.nif(arity=0), raises: [].} =
  withPacked():
    pi_spi.pi_spi_din_4ao_close() 

    return env.to_term( AtomOk )

func pi_spi_din_8ai_read_single(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_8ai_read_single(ce, channel) 

    return env.to_term( AtomOk )

func pi_spi_din_8di_read(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_8di_read(ce, address) 

    return env.to_term( AtomOk )

func pi_spi_din_8di_read_single(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_8di_read_single(ce, address, channel) 

    return env.to_term( AtomOk )

func pi_spi_din_8di_init(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_8di_init(ce, address) 

    return env.to_term( AtomOk )

func pi_spi_din_4ko_write(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let state = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4ko_write(ce, address, state) 

    return env.to_term( AtomOk )

func pi_spi_din_4ko_write_single(env; argc; argv): ErlNifTerm {.nif(arity=4), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    let state = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4ko_write_single(ce, address, channel, state) 
    return env.to_term( AtomOk )

func pi_spi_din_4ko_init(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4ko_init(ce, address) 
    return env.to_term( AtomOk )

func pi_spi_din_4freq_read_fixed(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4freq_read_fixed(ce, address, channel) 
    return env.to_term( AtomOk )

func pi_spi_din_4freq_read_variable(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4freq_read_variable(ce, address, channel) 
    return env.to_term( AtomOk )

func pi_spi_din_4freq_read_pulse(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4freq_read_pulse(ce, address, channel) 
    return env.to_term( AtomOk )

func pi_spi_din_4freq_read_di(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    pi_spi.pi_spi_din_4freq_read_di(ce, address) 
    return env.to_term( AtomOk )

func vpe_2901a_init(env; argc; argv): ErlNifTerm {.nif(arity=3), raises: [].} =
  withPacked():
    let ce = env.from_term(argv[0], uint32).get().uint8
    let address = env.from_term(argv[0], uint32).get().uint8
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.vpe_2901a_init() 
    return env.to_term( AtomOk )

func vpe_2901a_2ao_write_single(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    let counts = env.from_term(argv[0], uint32).get().uint8
    pi_spi.vpe_2901a_2ao_write_single(channel, counts) 

    return env.to_term( AtomOk )

func vpe_2901a_2ko_write_single(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    let value = env.from_term(argv[0], uint32).get().uint8
    pi_spi.vpe_2901a_2ko_write_single(channel, value) 
    return env.to_term( AtomOk )

func vpe_2901a_2di_read_single(env; argc; argv): ErlNifTerm {.nif(arity=1), raises: [].} =
  withPacked():
    let channel = env.from_term(argv[0], uint32).get().uint8
    pi_spi.vpe_2901a_2di_read_single(channel) 
    return env.to_term( AtomOk )

export_nifs(
  "Elixir.WidgetLordsNifs",
  [
    add_numbers,
    gpio_init,
    gpio_configure,
    gpio_read,
    pi_spi_init,
    pi_spi_2ao_write_single,
    pi_spi_8ai_read_single,
    pi_spi_8di_read,
    pi_spi_8di_read_single,
    pi_spi_8di_init,
    pi_spi_8ko_write,
    pi_spi_8ko_write_single,
    pi_spi_8ai_16b_set_channel,
    pi_spi_8ai_16b_read,
  ]
)
