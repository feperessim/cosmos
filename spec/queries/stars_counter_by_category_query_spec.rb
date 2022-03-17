# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StarsCounterByCategoryQuery do
     context 'When we have 2 stars of O' do 
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
      end

      describe '#count' do
        subject(:category_count) { described_class.new.count(category) }
        
        context 'When category is O' do
          let(:category) { 'O' }
          it { expect(subject).to eq(2) }
          
        end

        context 'When category is A' do
          let(:category) { 'A' }
          it { expect(subject).to eq(0) } 
        end

        context 'When category is invalid' do
          let(:category) { nil }
          it { expect(subject).to eq(0) } 
        end
      end
     end
end

