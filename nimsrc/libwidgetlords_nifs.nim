import nimler/nimler
import nimler/nimler/codec

import wrappers/gpio as gpio

using
  env: ptr ErlNifEnv
  argc: cint
  argv: ErlNifArgs

func add_numbers(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  let a1 = env.from_term(argv[0], int32).get(0)
  let a2 = env.from_term(argv[1], int32).get(0)
  let r = a1 + a2
  return env.to_term(r)

func gpio_init(env; argc; argv): ErlNifTerm {.nif(arity=0), raises: [].} =
  # let a1 = env.from_term(argv[0], int32).get(0)
  # let a2 = env.from_term(argv[1], int32).get(0)
  # let r = a1 + a2
  let err = gpio.gpio_init()

  if err >=  0:
    return env.to_term(AtomOk)
  else:
    return env.to_term( (AtomError, err,) )

func gpio_configure(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  let pin: uint32 = env.from_term(argv[0], uint32).get()
  let flags: uint8 = env.from_term(argv[1], uint32).get().uint8
  let err = gpio.gpio_configure(pin, flags)

  if err >=  0:
    return env.to_term(AtomOk)
  else:
    return env.to_term( (AtomError, err,) )

func gpio_read(env; argc; argv): ErlNifTerm {.nif(arity=1), raises: [].} =
  let pin: uint32 = env.from_term(argv[0], uint32).get()
  let err = gpio.gpio_read(pin)

  if err >=  0:
    return env.to_term(AtomOk)
  else:
    return env.to_term( (AtomError, err,) )


export_nifs(
  "Elixir.WidgetLordsNifs",
  [
    add_numbers,
    gpio_init,
    gpio_configure,
    gpio_read,
  ]
)
