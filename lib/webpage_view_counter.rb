# frozen_string_literal: true

require 'webpage_view_counter/version'
require 'webpage_view_counter/line_parser'
require 'webpage_view_counter/log_aggregator'
require 'webpage_view_counter/log_decorator'
require 'webpage_view_counter/log_presenter'
require 'webpage_view_counter/file_handler'
require 'webpage_view_counter/page_view_counter'

# project namespace
module WebpageViewCounter
  # main class to call PageViewCounter service
  class Error < StandardError; end

  def self.new(log)
    PageViewCounter.call(log)
  end
end
