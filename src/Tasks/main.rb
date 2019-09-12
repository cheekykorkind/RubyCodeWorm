#!/usr/bin/env ruby

require_relative 'requester_worm'
require_relative 'tree_worm'
require_relative 'absolute_zero_tree_worm'
require_relative 'acid_green_worm.rb'


# tree_worm = TreeWorm.new('https://api.github.com/repos/cheekykorkind/GithubApiTest/branches/master')
# tree_worm.start

# requester_worm = RequesterWorm.new 
# response = requester_worm.get_json 'https://github.com/cheekykorkind/GithubApiTest'


acid_green_worm = AcidGreenWorm.new('https://github.com/cheekykorkind/GithubApiTest/tree/master/app')
acid_green_worm.start


# absolute_zero_tree_worm = AbsoluteZeroTreeWorm.new('git@github.com:cheekykorkind/GithubApiTest.git')
# absolute_zero_tree_worm.start
