# frozen_string_literal: true

module WebpageViewCounter
  # class to handle file operations
  class FileHandler
    def self.open_file(file)
      File.open(file)
    rescue Errno::ENOENT
      abort 'Please provide a file that exists'
    end

    def self.read_and_aggregate_lines(file, visit_aggregator, unique_visit_aggregator)
      open_file(file).each_line do |line|
        visit_aggregator.aggregate_webpage_visits(parse_path(line))
        unique_visit_aggregator.aggregate_webpage_visits(parse_unique_path(line))
      end
    end

    def self.parse_path(line, parser = LineParser)
      parser.parsed_path(line)
    end

    def self.parse_unique_path(line, parser = LineParser)
      parser.parsed_unique_path(line)
    end
  end
end
