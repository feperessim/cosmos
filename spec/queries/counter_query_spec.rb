# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CounterQuery do
  let(:star1) do
    Star.create!(
      name: 'Proxima Centauri',
      mass: 2.446,
      distance_from_earth: 4.246
    )
  end

  let(:star2) do
    Star.create!(
      name: 'Alpha Centauri 333',
      mass: 2.188,
      distance_from_earth: 4.367
    )
  end

  let(:planet) do
    Planet.create!(
      name: 'Earth',
      mass: 1.0,
      distance_from_star: 4.367,
      orbital_period: 365,
      tidally_locked: false,
      category: :rocky,
      star_id: star1.id
    )
  end

  let(:bodies_counter) do
    described_class.new
  end

  describe '#count_stars' do
    before do
      star1
      star2
    end

    it 'counts the number of stars' do
      expect(bodies_counter.count_stars).to eq(2)
    end
  end

  describe '#count_planets' do
    before do
      planet
    end

    it 'counts the number of planets' do
      expect(bodies_counter.count_planets).to eq(1)
    end
  end

  describe '#count_moons' do
    it 'counts the number of moons' do
      expect(bodies_counter.count_moons).to eq(0)
    end
  end
end
