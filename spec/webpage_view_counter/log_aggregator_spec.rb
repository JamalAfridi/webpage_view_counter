# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  RSpec.describe LogAggregator do
    let(:log_aggregator) { described_class.new }

    describe '#initialize' do
      it 'creates a new object with a hash attribute' do
        expect(log_aggregator.webpage_visits).to be_a(Hash)
      end
    end

    describe '#aggregate_webpage_visits' do
      let(:path) { '/help_page' }
      let(:aggregate_views) { log_aggregator.aggregate_webpage_visits(path) }

      context 'when the path is not present in the hash' do
        it 'adds the path as a key and increments the value by one' do
          aggregate_views
          expect(log_aggregator.webpage_visits[path]).to eq(1)
        end
      end

      context 'when the path is present in the hash' do
        it 'increments the value by one' do
          log_aggregator.webpage_visits[path] = 1
          aggregate_views
          expect(log_aggregator.webpage_visits[path]).to eq(2)
        end
      end
    end
  end
end
