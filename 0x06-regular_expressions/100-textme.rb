#!/usr/bin/env ruby

if ARGV.length != 1
  puts "Usage: #{$0} 'log_entry'"
  exit
end

log_entry = ARGV[0]

# Regular expression to match the required fields
pattern = /\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/

match_data = pattern.match(log_entry)

if match_data
  sender = match_data[1]
  receiver = match_data[2]
  flags = match_data[3]

  # Ensure '+' signs are not removed in output
  sender.gsub!(/^\+/, '')
  receiver.gsub!(/^\+/, '')

  # Print the formatted output
  puts "#{sender},#{receiver},#{flags}"
else
  puts "No match found"
end
