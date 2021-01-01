# frozen_string_literal: true

module WebpageViewCounter
  # class to parse webpage paths
  class LineParser
    def self.parsed_path(path)
      path[%r{^(/\w+)}]
    end
  end
end
