# frozen_string_literal: true

require_relative '../data/pages'
require_relative 'log_file_reader'

class LogFileParser
  def initialize(log_file_path:)
    @log_file_path = log_file_path
  end

  def log_data
    pages = Pages.new

    file_contents.each do |line|
      path, ip_address = line.split

      pages.add_page(path:, ip_address:)
    end

    pages
  end

  private

  attr_reader :log_file_path

  def file_contents
    @file_contents ||= file_loader.read
  end

  def file_loader
    LogFileReader.new(log_file_path:)
  end
end
