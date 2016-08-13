defmodule DistributedBlinky.Led do
  @moduledoc false
  alias Nerves.Leds

  def blink_once(ms \\ 1000) do
    Leds.set green: true
    :timer.sleep ms
    Leds.set green: false
  end

end
