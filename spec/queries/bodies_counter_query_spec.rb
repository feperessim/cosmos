# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BodiesCounterQuery do
  subject(:bodies_counter) { described_class.new }

  describe '#count_stars' do
    subject(:count_stars) { bodies_counter.count_stars }

    before do
      Star.create!(name: 'Alpha Centauri 333', mass: 2.188, distance_from_earth: 4.367)
      Star.create!(name: 'Proxima Centauri', mass: 2.446, distance_from_earth: 4.246)
    end

    it 'counts the number of stars' do
      expect(count_stars).to eq(2)
    end
  end

  describe '#count_planets' do
    subject(:count_planets) { bodies_counter.count_planets }

    before do
      Star.create!(name: 'Alpha Centauri 333', mass: 2.188, distance_from_earth: 4.367)
      Planet.create!(name: 'Earth', mass: 1.0, distance_from_star: 4.367, orbital_period: 365, tidally_locked: false,
                     category: :rocky, star_id: Star.first.id)
    end

    it 'counts the number of planets' do
      expect(count_planets).to eq(1)
    end
  end

  describe '#count_moons' do
    it 'counts the number of moons' do
      expect(bodies_counter.count_moons).to eq(0)
    end
  end
end
