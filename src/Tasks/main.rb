require_relative 'requester_worm'  
require_relative 'tree_worm'  

# requester_worm = RequesterWorm.new

tree_worm = TreeWorm.new('https://api.github.com/repos/cheekykorkind/GithubApiTest/branches/master')
# tree_worm.set_root_url requester_worm.get_json 'https://api.github.com/repos/cheekykorkind/GithubApiTest/branches/master'

tree_worm.start


# tree1_url = requester_worm.get_json tree_worm.get_root_url

# puts tree_worm.get_tree tree1_url
# puts tree_worm.is_terminal tree1_url
