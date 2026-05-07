#!/usr/bin/env ruby

require 'optparse'

TASKS_FILE = 'tasks.txt'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: cli.rb [options]'

  opts.on('-a', '--add TASK', 'Add a new task') do |task|
    options[:add] = task
  end

  opts.on('-l', '--list', 'List all tasks') do
    options[:list] = true
  end

  opts.on('-r', '--remove INDEX', Integer, 'Remove a task by index') do |index|
    options[:remove] = index
  end

  opts.on('-h', '--help', 'Show help') do
    puts opts
    exit
  end
end.parse!

if options[:add]
  File.open(TASKS_FILE, 'a') do |file|
    file.puts options[:add]
  end
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  if File.exist?(TASKS_FILE) && !File.zero?(TASKS_FILE)
    puts 'Tasks:'
    File.foreach(TASKS_FILE) do |task|
      puts "#{task.chomp},"
    end
  else
    puts 'No tasks found.'
  end

elsif options[:remove]
  if File.exist?(TASKS_FILE)
    tasks = File.readlines(TASKS_FILE, chomp: true)

    if options[:remove] >= 1 && options[:remove] <= tasks.length
      removed = tasks.delete_at(options[:remove] - 1)

      File.open(TASKS_FILE, 'w') do |file|
        tasks.each { |task| file.puts task }
      end

      puts "Task '#{removed}' removed."
    else
      puts 'Invalid index.'
    end
  else
    puts 'No tasks found.'
  end
end
