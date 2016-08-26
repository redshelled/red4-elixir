defmodule Physics.Rocketry do
  import Converter
  import Calcs
  import Physics.Laws
  import Planets

##old method replace by modules
  #@moon  %{mass: 7.35e22, radius: 1.738e6}
  #@mars  %{mass: 6.39e23, radius: 3.4e6}
  #@earth %{mass: 5.972e24, radius: 6.371e6}
  #@newtons_constant 6.67e-11

  def escape_velocity(:earth), do: earth |> escape_velocity
  def escape_velocity(:mars), do: mars   |> escape_velocity
  def escape_velocity(:moon), do: moon   |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def orbital_acceleration(height), do:
      (orbital_speed(height) |> squared) / orbital_radius(height)

  def orbital_term(height), do:
    (4 * (pi_const |> squared) * (orbital_radius(height) |> cubed)) / ((newtons_gravitational_constant * earth.mass)
      |> square_root
      |> seconds_to_hours

  def orbital_speed(height), do:
    newtons_gravitational_constant * Planets.earth.mass / orbital_radius(height) |> square_root

  def target_orbital_term(term), do:
    (newtons_gravitational_constant * Planets.earth.mass * (term |> squared)) / (4 * (pi_const |> squared))
      |> cube_root
      |> to_km

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height), do:
    Planets.earth.radius + (height |> to_meters)

end
