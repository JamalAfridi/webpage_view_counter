# frozen_string_literal: true

module WebpageViewCounter
  # class to aggregate number of webpage visits
  class LogAggregator
    attr_reader :webpage_visits

    def initialize
      @webpage_visits = Hash.new(0)
    end

    def aggregate_webpage_visits(path)
      webpage_visits[path] += 1
    end
  end
end
