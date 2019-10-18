#!/usr/bin/env ruby

require_relative 'directory_worm.rb'
require_relative 'traversal_worm'

@todo_list = []
@base_url = 'https://github.com'

include TraversalWorm

navigation_items = DirectoryWorm.new('https://github.com/cheekykorkind/GithubApiTest/tree/master').get_navigation_items

puts 'start'
self.traverse_navigation_items(navigation_items)
puts "================================================"

puts 'todo list'
puts @todo_list

puts 'end'
