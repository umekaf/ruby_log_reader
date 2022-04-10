# frozen_string_literal: true

module LogReader
  class FileReader
    def initialize(path)
      @path = path
    end

    attr_reader :path

    def file_lines
      requested_file.map(&:chomp)
    end

    private

    def requested_file
      File.open(path)
    rescue Errno::ENOENT => e
      raise LogReader::Error, e.message
    end
  end
end
