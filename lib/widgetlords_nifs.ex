defmodule WidgetLordsNifs do
  require Logger
  @on_load :load_nif

  @type uint32_t :: non_neg_integer()
  @type uint8_t :: non_neg_integer()
  @type int8_t :: integer()
  @type int32_t :: integer()

  def add_numbers(_a, _b), do: raise "not implemented"
  @spec gpio_init() :: :ok | {:error, integer()}
  def gpio_init(), do: raise "not implemented"

  @spec gpio_configure(pin :: uint32_t(), flags: uint32_t()) :: int8_t()
  def gpio_configure(_pin, _flags), do: raise "not implemented"

  @spec gpio_write(pin :: uint32_t(), value :: uint8_t()) :: int8_t()
  def gpio_write(_pin, _value), do: raise "not implemented"

  @spec gpio_read(pin :: uint32_t()) :: int8_t()
  def gpio_read(_pin), do: raise "not implemented"


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
