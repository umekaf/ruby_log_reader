# frozen_string_literal: true

require 'log_reader/version'
require 'log_reader/file_reader'
require 'log_reader/line_content_segregator'
require 'log_reader/content_segregator'
require 'log_reader/aggregator'
require 'log_reader/collector'
require 'log_reader/collection_sortor'

module LogReader
  class Error < StandardError; end
  # Your code goes here...
end
