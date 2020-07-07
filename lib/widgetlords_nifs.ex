defmodule WidgetLordsNifs do
  require Logger
  @on_load :load_nif

  def add_numbers(_a, _b), do: raise "not implemented"
  @spec gpio_init() :: :ok | :error
  def gpio_init(), do: raise "not implemented"
  @spec gpio_configure(_pin: uint32_t; flags: uint8_t) {.cdecl,
  def gpio_configure(_pin: uint32_t; flags: uint8_t) {.cdecl,
  def gpio_write(pin: uint32_t; value: uint8_t) {.cdecl, importc: "gpio_write",
  def gpio_read(pin: uint32_t): int8_t {.cdecl, importc: "gpio_read", header: "gpio.h".}


  def load_nif do
    sofile =
      :code.priv_dir(:widgetlords_nifs) |>
      to_string() |>
      Path.join("widgetlords_nifs") |>
      to_char_list()

    :erlang.load_nif(sofile, 0)
  end

  def test() do
  end
end
