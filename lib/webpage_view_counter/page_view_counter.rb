# frozen_string_literal: true

module WebpageViewCounter
  # service class to aggregate webpage visits and print the outcome
  class PageViewCounter
    def self.call(log)
      new(log).execute
    end

    def initialize(log, visit_aggregator = LogAggregator.new, unique_visit_aggregator = LogAggregator.new)
      @log = log
      @visit_aggregator = visit_aggregator
      @unique_visit_aggregator = unique_visit_aggregator
    end

    def execute
      aggregate_log_file
      print_webpage_visits
      print_unique_webpage_visits
    end

    private

    def aggregate_log_file
      FileHandler.read_and_aggregate_lines(log, visit_aggregator, unique_visit_aggregator)
    end

    def print_webpage_visits
      LogPresenter.print_webpage_visits(LogDecorator.sort(visit_aggregator.webpage_visits))
    end

    def print_unique_webpage_visits
      LogPresenter.print_unique_webpage_visits(LogDecorator.sort(unique_visit_aggregator.webpage_visits))
    end

    def parse_path(line)
      LineParser.parsed_path(line)
    end

    def parse_unique_path(line)
      LineParser.parsed_unique_path(line)
    end

    attr_reader :log, :visit_aggregator, :unique_visit_aggregator
  end
end
