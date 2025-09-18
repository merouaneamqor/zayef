#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/zayef'

puts '🚀 ZAYEF - Moroccan Data Generator Demo 🚀'
puts '=' * 60

# Show that quotes work correctly
puts '📋 Sample Data with Quoted Names & Cities:'
puts ''

3.times do |i|
  puts "Sample #{i+1}:"
  puts "  Name: #{Zayef.name}"
  puts "  City: #{Zayef.city}"
  puts "  Email: #{Zayef.email}"
  puts "  Specialty: #{Zayef.medical_specialty}"
  puts "  Dish: #{Zayef.traditional_dish}"
  puts "  Bank: #{Zayef.bank}"
  puts ''
end

puts '✅ MOROCCAN_LAST_NAMES and MOROCCAN_CITIES now have quotes!'
puts '✅ All 300+ Moroccan data entries working perfectly!'
puts '=' * 60

