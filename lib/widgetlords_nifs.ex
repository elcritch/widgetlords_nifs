defmodule WidgetLordsNifs do
  require Logger
  @on_load :load_nif

  @type uint32 :: non_neg_integer()
  @type uint16 :: non_neg_integer()
  @type uint8 :: non_neg_integer()
  @type int8 :: integer()
  @type int32 :: integer()
#
  def add_numbers(_a, _b), do: raise "not implemented"
  @spec gpio_init() :: :ok | {:error, integer()}
  def gpio_init(), do: raise "not implemented"

  @spec gpio_configure(pin :: uint32(), flags: uint32()) :: int8()
  def gpio_configure(_pin, _flags), do: raise "not implemented"

  @spec gpio_write(pin :: uint32(), value :: uint8()) :: int8()
  def gpio_write(_pin, _value), do: raise "not implemented"

  @spec gpio_read(pin :: uint32()) :: int8()
  def gpio_read(_pin), do: raise "not implemented"


  # @spec spi_open(channel :: uint8, speed :: uint32) :: :ok
  # def spi_open(_channel, _speed), do: raise "not implemented"
  # @spec spi_transfer(data :: list(uint8), len :: uint32) :: :ok
  # def spi_transfer(_data, _len), do: raise "not implemented"

  # ======================================================================= #
  # PI_SPI
  # ======================================================================= #
  @spec pi_spi_init() :: :ok
  def pi_spi_init(), do: raise "not implemented"

  @spec pi_spi_2ao_write_single(channel :: uint8, counts :: uint16, ctype :: uint8) :: :ok
  def pi_spi_2ao_write_single(_channel, _counts, _ctype), do: raise "not implemented"

  @spec pi_spi_8ai_read_single(channel :: uint8, ctype :: uint8) :: uint16
  def pi_spi_8ai_read_single(_channel, _ctype), do: raise "not implemented"

  @spec pi_spi_8di_read(address :: uint8, ctype :: uint8) :: uint8
  def pi_spi_8di_read(_address, _ctype), do: raise "not implemented"

  @spec pi_spi_8di_read_single(address :: uint8, channel :: uint8, ctype :: uint8) :: uint8
  def pi_spi_8di_read_single(_address, _channel, _ctype), do: raise "not implemented"

  @spec pi_spi_8di_init(address :: uint8, ctype :: uint8) :: :ok
  def pi_spi_8di_init(_address, _ctype), do: raise "not implemented"

  @spec pi_spi_8ko_write(data :: uint8, ctype :: uint8) :: :ok
  def pi_spi_8ko_write(_data, _ctype), do: raise "not implemented"

  @spec pi_spi_8ko_write_single(channel :: uint8, data :: uint8, ctype :: uint8) :: :ok
  def pi_spi_8ko_write_single(_channel, _data, _ctype), do: raise "not implemented"

  @spec pi_spi_8ai_16b_set_channel(channel :: uint8, ctype :: uint8) :: :ok
  def pi_spi_8ai_16b_set_channel(_channel, _ctype), do: raise "not implemented"

  @spec pi_spi_8ai_16b_read(ctype :: uint8) :: uint16
  def pi_spi_8ai_16b_read(_ctype), do: raise "not implemented"

  # ======================================================================= #
  # PI_SPI_DIN
  # ======================================================================= #
  proc pi_spi_din_init()
  proc pi_spi_din_4ao_init()
  proc pi_spi_din_4ao_write_single(address: uint8_t; channel: uint8_t; counts: uint16_t)
  proc pi_spi_din_4ao_close()
  proc pi_spi_din_8ai_read_single(ce: chip_enable; channel: uint8_t): uint16_t
  proc pi_spi_din_8di_read(ce: chip_enable; address: uint8_t): uint8_t
  proc pi_spi_din_8di_read_single(ce: chip_enable; address: uint8_t; channel: uint8_t): uint8_t
  proc pi_spi_din_8di_init(ce: chip_enable; address: uint8_t)
  proc pi_spi_din_4ko_write(ce: chip_enable; address: uint8_t; state: uint8_t)
  proc pi_spi_din_4ko_write_single(ce: chip_enable; address: uint8_t; channel: uint8_t; state: uint8_t)
  proc pi_spi_din_4ko_init(ce: chip_enable; address: uint8_t)
  proc pi_spi_din_4freq_read_fixed(ce: chip_enable; address: uint8_t; channel: uint8_t): uint32_t
  proc pi_spi_din_4freq_read_variable(ce: chip_enable; address: uint8_t; channel: uint8_t): uint32_t
  proc pi_spi_din_4freq_read_pulse(ce: chip_enable; address: uint8_t; channel: uint8_t): uint32_t
  proc pi_spi_din_4freq_read_di(ce: chip_enable; address: uint8_t): uint8_t
  proc vpe_2901a_init()
  proc vpe_2901a_2ao_write_single(channel: uint8_t; counts: uint16_t)
  proc vpe_2901a_2ko_write_single(channel: uint8_t; value: uint8_t)
  proc vpe_2901a_2di_read_single(channel: uint8_t): uint8_t

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
