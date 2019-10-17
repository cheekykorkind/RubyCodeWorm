#!/usr/bin/env ruby

require_relative 'requester_worm'
require_relative 'tree_worm'
require_relative 'acid_green_worm.rb'
require_relative 'traversal_worm'

include TraversalWorm

# acid_green_worm = AcidGreenWorm.new('https://github.com/cheekykorkind/GithubApiTest/tree/master/app')
acid_green_worm = AcidGreenWorm.new('https://github.com/cheekykorkind/GithubApiTest/tree/master')
acid_green_worm.start
navigation_items = acid_green_worm.get_navigation_items


# self.traverse_navigation_items(navigation_items)
