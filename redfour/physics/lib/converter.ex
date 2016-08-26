defmodule Converter do

  def to_nearest_tenth(val) do
    Float.round(val, 1)
  end

  def to_km(val) do
    val / 1000
  end

  def to_light_seconds({:miles, miles} = val, precision: precision) do
    (miles * 5.36819e-6) |> round_up
  end

  def to_light_seconds({:meters, meters} = val, precision: precision) do
    (meters * 3.335638620368e-9) |> round_up
  end

  def to_meters(val) do
    val / 1000
  end

  def seconds_to_hours(seconds) do
     seconds / 60
  end

  def round_up(val) when is_float(val), do: trunc(val)

end
