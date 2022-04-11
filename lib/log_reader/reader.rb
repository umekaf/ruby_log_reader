# frozen_string_literal: true

module LogReader
  class Reader
    def initialize(file_path)
      @file_path = file_path
    end

    attr_reader :file_path

    def format
      ResponseFormatter.new(collector_data).format
    end

    private

    def collector_data
      Collector.new(segregated_data).group
    end

    def segregated_data
      ContentSegregator.new(read_data).segregate
    end

    def read_data
      FileReader.new(file_path).file_lines
    end
  end
end
