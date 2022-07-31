# frozen_string_literal: true

require_relative 'src/files/log_file_parser'

log_file_path, view = ARGV

pages = LogFileParser.new(log_file_path:).log_data

if view.eql?('total')
  puts 'Total views \n'

  pages.by_total_views.each do |page|
    puts "#{page.path} #{page.total_views} visits"
  end

  exit
end

if view.eql?('unique')
  puts 'Unique views \n'

  pages.by_unique_views.each do |page|
    puts "#{page.path} #{page.unique_views} unique views"
  end

  exit
end

puts "
     'Usage'
     .\\parser.rb path_to_log_file view_mode.

     Where view_mode is either 'total' or 'unique'.
"
