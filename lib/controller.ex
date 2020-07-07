defmodule WidgetLordsNifs.Controller do
  require Logger
  @on_load :load_nif

  def create_resource(), do: raise "not implemented"
  def update_resource(_a, _b, _c), do: raise "not implemented"

  def load_nif do
    sofile =
      :code.priv_dir(:widgetlords_nifs) |>
      to_string() |>
      Path.join("widgetlords_nifs") |>
      to_char_list()

    IO.inspect(sofile, label: :sofile)
    sofile |> :erlang.load_nif(0)

  end

  def test() do
    {:ok, ctrl} = create_resource()
    IO.inspect(update_resource(ctrl, 10.0, 1.0), label: 'PIControl update')
    IO.inspect(update_resource(ctrl, 10.0, 5.0), label: 'PIControl update')
    IO.inspect(update_resource(ctrl, 10.0, 8.0), label: 'PIControl update')
    :ok
  end
end
