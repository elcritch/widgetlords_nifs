import nimler/nimler
import nimler/nimler/codec

import wrappers/gpio

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
  let err = gpio_init()

  if err >=  0:
    return env.to_term(AtomOk)
  else:
    return env.to_term( (AtomError, err,) )


export_nifs(
  "Elixir.WidgetLordsNifs",
  [
    add_numbers,
    gpio_init,
  ]
)
