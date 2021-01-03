# frozen_string_literal: true

require 'spec_helper'

RSpec.describe WebpageViewCounter do
  describe '.new' do
    it 'calls the page view counter service with the provided log file' do
      allow(WebpageViewCounter::PageViewCounter).to receive(:call)
      described_class.new(:log)
      expect(WebpageViewCounter::PageViewCounter).to have_received(:call).with(:log)
    end
  end
end
