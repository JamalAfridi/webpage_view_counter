# frozen_string_literal: true

module WebpageViewCounter
  # class to print webpage visits
  class LogPresenter
    def self.print_webpage_visits(webpage_visits)
      puts 'page views'
      print_visits(webpage_visits, 'visits')
      puts ''
    end

    def self.print_unique_webpage_visits(webpage_visits)
      puts 'unique page views'
      print_visits(webpage_visits, 'unique views')
      puts ''
    end

    def self.print_visits(webpage_visits, label)
      webpage_visits.each { |k, v| puts "#{k} #{v} #{label}" }
    end
  end
end
