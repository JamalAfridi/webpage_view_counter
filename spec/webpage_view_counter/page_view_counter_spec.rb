# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  RSpec.describe PageViewCounter do
    let(:count_page_views) { described_class.call('test.log') }

    let(:aggregator) { LogAggregator.new }

    describe '.call' do
      msg = <<~PUBLISHED
        page views
        /help_page 1 visits

        unique page views
        /help_page/1 1 unique views

      PUBLISHED

      it 'creates aggregators' do
        allow(LogAggregator).to receive(:new).and_return(aggregator)
        count_page_views
        expect(LogAggregator).to have_received(:new).exactly(2).times
      end

      it 'aggregates webpage visits' do
        allow(LogAggregator).to receive(:new).and_return(aggregator)
        count_page_views
        expect(aggregator.webpage_visits).to eq({ '/help_page' => 1, '/help_page/1' => 1 })
      end

      it 'prints the results to stdout' do
        expect { count_page_views }.to output(msg).to_stdout
      end
    end
  end
end
