# frozen_string_literal: true

require 'spec_helper'

module WebpageViewCounter
  # rubocop:disable Metrics/BlockLength
  RSpec.describe FileHandler do
    # rubocop:enable Metrics/BlockLength
    describe '.open_file' do
      it 'opens the given file' do
        file = instance_double('File')
        allow(File).to receive(:open).and_return(file)
        described_class.open_file(file)
        expect(File).to have_received(:open)
      end

      context 'when the file does not exist' do
        it 'exits with a friendly message' do
          msg = 'Please provide a file that exists'
          expect(described_class.open_file('non_existent_file.txt')).to output(msg).to_stdout
        end
      end
    end

    describe '.read_and_aggregate_lines' do
      let(:read_lines) do
        described_class.read_and_aggregate_lines('test.log', visit_aggregator, unique_visit_aggregator)
      end
      let(:visit_aggregator) { LogAggregator.new }
      let(:unique_visit_aggregator) { LogAggregator.new }

      it 'reads and aggregates webpage visits from each line' do
        expect { read_lines }.to change(visit_aggregator, :webpage_visits).from({}).to({ '/help_page' => 1 })
      end

      it 'reads and aggregates unique webpage visits from each line' do
        expect { read_lines }.to change(unique_visit_aggregator, webpage_visits).from({}).to({ '/help_page/1' => 1 })
      end
    end

    describe 'parsing file line' do
      let(:line) { '/help_page/1 126.318.035.038' }

      describe '.parse_path' do
        it 'parses the given line' do
          expect(described_class.parse_path(line)).to eq('/help_page')
        end
      end

      describe '.parse_unique_path' do
        it 'parses the given line' do
          expect(described_class.parse_unique_path(line)).to eq('/help_page/1')
        end
      end
    end
  end
end
