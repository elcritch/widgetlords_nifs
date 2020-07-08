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
