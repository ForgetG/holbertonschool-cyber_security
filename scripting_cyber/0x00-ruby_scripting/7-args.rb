#!/usr/bin/env ruby

# Prints command-line arguments
def print_arguments
  args = ARGV

  if args.empty?
    puts 'No arguments provided.'
    return
  end

  index = 1

  args.each do |arg|
    puts "#{index}. #{arg}"
    index += 1
  end
end
