# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  RSpec.describe LineParser do
    describe '.parsed_path' do
      it 'takes a webpage path and IP address and returns the path' do
        path = '/help_page/1 646.865.545.408'
        expect(described_class.parsed_path(path)).to eq('/help_page')
      end
    end
  end
end
