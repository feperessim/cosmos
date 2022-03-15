# frozen_string_literal: true

class CounterQuery
  def count_stars
    Star.count
  end

  def count_planets
    Planet.count
  end

  def count_moons
    Moon.count
  end
end
