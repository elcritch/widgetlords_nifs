import nimler/nimler
import nimler/nimler/codec
import nimler/nimler/resources
import ./controller

const rate = 100.0
const min = -10.0
const max = 10.0
const kp = 0.5
const ki = 0.25
const kf = 1.0

using
  env: ptr ErlNifEnv
  argc: cint
  argv: ErlNifArgs

func create_resource(env; argc; argv): ErlNifTerm =
  let res = env.new_resource(PIControl)

  if res.isNone():
    return env.error(env.to_term("fail to allocate new resource"))

  init_controller(res.get(), rate, min, max, kp, ki, kf)
  return env.ok(env.release_resource(res.get()))

func update_resource(env; argc; argv): ErlNifTerm =
  let resource = env.get_resource(argv[0], PIControl)

  if resource.isNone():
    return enif_make_badarg(env)

  let controller = resource.get()
  let sp = env.from_term(argv[1], float)
  let pv = env.from_term(argv[2], float)

  if sp.isNone() or pv.isNone():
    return enif_make_badarg(env)

  let res = controller.update(sp.get(), pv.get())

  return env.ok(env.to_term(res))

func add_numbers(env; argc; argv): ErlNifTerm {.nif(arity=2), raises: [].} =
  let a1 = env.from_term(argv[0], int32).get(0)
  let a2 = env.from_term(argv[1], int32).get(0)
  let r = a1 + a2
  return env.to_term(r)

resources.export_nifs(
  "Elixir.WidgetLordsNifs.Controller",
  [
    add_numbers,
    create_resource.to_nif(name="create_resource", arity=0, flags=ERL_NIF_DIRTY_IO),
    update_resource.to_nif(name="update_resource", arity=3),
  ]
)
