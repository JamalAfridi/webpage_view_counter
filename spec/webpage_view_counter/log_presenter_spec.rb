# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  # rubocop:disable Metrics/BlockLength
  RSpec.describe LogPresenter do
    # rubocop:enable Metrics/BlockLength
    let(:webpage_visits) { { '/help_page' => 2, '/contact' => 1 } }

    describe '.print_webpage_visits' do
      msg = <<~VISITS
        page views
        /help_page 2 visits
        /contact 1 visits

      VISITS

      it 'prints webpage visits to stdout' do
        expect { described_class.print_webpage_visits(webpage_visits) }.to output(msg).to_stdout
      end
    end

    describe '.print_unique_webpage_visits' do
      msg = <<~UNIQUE_VISITS
        unique page views
        /help_page 2 unique views
        /contact 1 unique views

      UNIQUE_VISITS

      it 'prints unique webpage visits to stdout' do
        expect { described_class.print_unique_webpage_visits(webpage_visits) }.to output(msg).to_stdout
      end
    end

    describe '.print_visits' do
      msg = <<~VISITS
        /help_page 2 views
        /contact 1 views
      VISITS

      it 'prints visits to stdout' do
        expect { described_class.print_visits(webpage_visits, 'views') }.to output(msg).to_stdout
      end
    end
  end
end
