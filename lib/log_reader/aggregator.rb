# frozen_string_literal: true

module LogReader
  class Aggregator
    attr_accessor :total, :unique, :ips

    def initialize
      @total = 0
      @unique = 0
      @ips = {}
    end

    def call(line_content)
      self.total += 1
      return if ips[line_content.ip]

      self.unique += 1
      ips[line_content.ip] = true
    end
  end
end
