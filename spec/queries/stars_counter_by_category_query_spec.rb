# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StarsCounterByCategoryQuery do
  before do
    Star.create!(
      name: 'Proxima Centauri',
      mass: 2.446,
      category: :O,
      distance_from_earth: 4.246
    )

    Star.create!(
      name: 'Alpha Centauri 333',
      mass: 2.188,
      category: :O,
      distance_from_earth: 4.367
    )

    Star.create!(
      name: 'Star 1',
      mass: 27_345_242.82971121,
      category: :B,
      distance_from_earth: 32.26483727370002
    )

    Star.create!(
      name: 'Star 2',
      mass: 50_045_831.75365358,
      category: :A,
      distance_from_earth: 11.81970786818194
    )
  end

  let(:stars_counter_by_category) do
    described_class.new
  end

  let(:stars_count_by_cat_hash) do
    {
      'O' => stars_counter_by_category.count('O'),
      'B' => stars_counter_by_category.count('B'),
      'A' => stars_counter_by_category.count('A'),
      'F' => stars_counter_by_category.count('F'),
      'G' => stars_counter_by_category.count('G'),
      'K' => stars_counter_by_category.count('K'),
      'M' => stars_counter_by_category.count('M')
    }
  end

  describe '#count' do
    it 'counts the number of stars given a category' do
      expect(
        stars_count_by_cat_hash
      ).to include(
        {
          'O' => 2,
          'B' => 1,
          'A' => 1,
          'F' => 0,
          'G' => 0,
          'K' => 0,
          'M' => 0
        }
      )
    end
  end
end
