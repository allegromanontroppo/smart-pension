# frozen_string_literal: true

class LogFileReader
  def initialize(log_file_path:)
    @log_file_path = log_file_path
  end

  def read
    file_contents = []

    File.open(log_file_path) do |file|
      file_contents = file.readlines.map(&:strip)
    end

    file_contents
  end

  private

  attr_reader :log_file_path
end
