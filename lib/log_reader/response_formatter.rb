# frozen_string_literal: true

module LogReader
  class ResponseFormatter
    def initialize(sorted_collection)
      @sorted_collection = sorted_collection
    end

    attr_reader :sorted_collection

    def format
      <<~EOF
        Total view by pages:
        #{total_views}
        Unique views by pages:
        #{unique_views}
      EOF
    end
  end
end

private

def total_views
  sorted_collection.sort_by_total_views.map do |path, aggregator|
    "#{path} #{aggregator.total} visits"
  end.join("\n")
end

def unique_views
  sorted_collection.sort_by_uniq_view.map do |path, aggregator|
    "#{path} #{aggregator.unique} unique visits"
  end.join("\n")
end
