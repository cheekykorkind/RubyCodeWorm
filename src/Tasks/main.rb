#!/usr/bin/env ruby

require_relative 'requester_worm'
require_relative 'tree_worm'
require_relative 'absolute_zero_tree_worm'

# tree_worm = TreeWorm.new('https://api.github.com/repos/cheekykorkind/GithubApiTest/branches/master')
# tree_worm.start

absolute_zero_tree_worm = AbsoluteZeroTreeWorm.new('git@github.com:cheekykorkind/GithubApiTest.git')
absolute_zero_tree_worm.start
