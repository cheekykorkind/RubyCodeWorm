#!/usr/bin/env ruby

require_relative 'acid_green_worm.rb'
require_relative 'traversal_worm'

@base_url = 'https://github.com'

include TraversalWorm

acid_green_worm = AcidGreenWorm.new('https://github.com/cheekykorkind/GithubApiTest/tree/master')
acid_green_worm.start
navigation_items = acid_green_worm.get_navigation_items

puts 'start'
self.traverse_navigation_items(navigation_items)
puts "================================================"
puts 'end'
