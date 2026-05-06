#!/usr/bin/env ruby
require 'json'

# Merges JSON objects from file1 into file2
# @param file1_path [String] source file
# @param file2_path [String] destination file
def merge_json_files(file1_path, file2_path)
  data1 = JSON.parse(File.read(file1_path))
  data2 = JSON.parse(File.read(file2_path))

  merged_data = data2 + data1

  File.write(file2_path, JSON.pretty_generate(merged_data))
end
