# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  RSpec.describe LineParser do
    let(:path) { '/help_page/1 646.865.545.408' }

    describe '.parsed_path' do
      it 'takes a webpage path and IP address string and returns the general path' do
        expect(described_class.parsed_path(path)).to eq('/help_page')
      end
    end

    describe '.parsed_unique_path' do
      it 'takes a webpage path and IP address string and returns the unique path' do
        expect(described_class.parsed_unique_path(path)).to eq('/help_page/1')
      end
    end
  end
end
