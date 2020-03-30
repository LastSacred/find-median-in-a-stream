require "pry"
require "./values.rb"
require "./stream.rb"
require "./priority_queue.rb"

puts Stream.new(INPUT).medians == EXPECTED_OUTPUT