# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClosestCandidatesQuery do
  context 'when there are 2 planets with conditions: rocky, in habitable zone, with acceptable gravity, with non synchronized rotation' do
    before do
      Star.create!(
        name: 'Proxima Centauri',
        mass: 2.446,
        category: :O,
        distance_from_earth: 4.246
      )

      Star.create!(
        name: 'Alpha Centauri 333',
        mass: 1.5,
        category: :O,
        distance_from_earth: 4.367
      )

      Planet.create!(
        name: 'Earth',
        mass: 1.0,
        distance_from_star: 4.367,
        orbital_period: 365,
        tidally_locked: false,
        category: :rocky,
        star_id: Star.first.id
      )

      Planet.create!(
        name: 'Exoplanet',
        mass: 0.7,
        distance_from_star: 3.337,
        orbital_period: 457,
        tidally_locked: false,
        category: :rocky,
        star_id: Star.second.id
      )
    end

    describe '#n_closest_candidates' do
      subject(:n_closest_candidates) { described_class.new.n_closest_candidates(n: n) }

      context 'When n is 2' do
        let(:n) { 2 }

        it { expect(subject).to match_array([Planet.first, Planet.second]) }
      end

      context 'When n is 0' do
        let(:n) { 0 }

        it { expect(subject).to match_array([]) }
      end
    end
  end

  context 'when there are planets without meeting at least one of the conditions: rocky, in habitable zone, with acceptable gravity, with non synchronized rotation' do
    before do
      Star.create!(
        name: 'Proxima Centauri',
        mass: 2.446,
        category: :O,
        distance_from_earth: 4.246
      )

      Planet.create!(
        name: 'Exoplanet',
        mass: 0.7,
        distance_from_star: 3.337,
        orbital_period: 457,
        tidally_locked: false,
        category: :gaseous,
        star_id: Star.first.id
      )
    end

    describe '#n_closest_candidates' do
      subject(:n_closest_candidates) { described_class.new.n_closest_candidates(n: n) }

      context 'When n is 1' do
        let(:n) { 1 }

        it { expect(subject).to match_array([]) }
      end
    end
  end
end
