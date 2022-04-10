# frozen_string_literal: true

module LogReader
  class ContentSegregator
    def initialize(file_lines)
      @file_lines = file_lines
    end
    attr_reader :file_lines

    def segregate
      file_lines.map { |line| LineContentSegregator.new(*line.split) }
    end
  end
end
