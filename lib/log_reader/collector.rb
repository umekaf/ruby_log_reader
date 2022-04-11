# frozen_string_literal: true

module LogReader
  class Collector
    def initialize(contents)
      @contents = contents
    end

    attr_reader :contents

    def group
      contents.each_with_object(SortCollection.new) do |content, collection|
        collection[content.path] ||= Aggregator.new
        collection[content.path].call(content)
      end
    end
  end
end
