# frozen_string_literal: true

module WebpageViewCounter
  # class to sort a collection of webpage visits
  class LogDecorator
    def self.sort(webpage_visits)
      Hash[webpage_visits.sort_by { |_key, value| -value }]
    end
  end
end
