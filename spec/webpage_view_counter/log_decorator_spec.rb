# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  RSpec.describe LogDecorator do
    describe '.sort' do
      it 'sorts the log aggregator webpage visits in descending order' do
        webpage_visits = { '/help_page' => 2, '/contact' => 1, '/home' => 3 }
        expected_result = { '/home' => 3, '/help_page' => 2, '/contact' => 1 }

        expect(described_class.sort(webpage_visits)).to eq(expected_result)
      end
    end
  end
end
