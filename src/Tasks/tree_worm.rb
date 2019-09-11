require 'json'
require_relative 'requester_worm'

class TreeWorm < RequesterWorm
  def initialize(branch_url)
    json_response = self.get_json branch_url
    parsedJson = JSON.parse(json_response)
    puts parsedJson
    @root_url = parsedJson['commit']['commit']['tree']['url']
  end

  def start()
    tree = move_next_leaf(@root_url)
  end

  def get_root_url
    @root_url
  end

  def move_next_leaf(url)
    json_response = self.get_json url
    parsedJson = JSON.parse(json_response)

    unless parsedJson.has_key? 'truncated'
      puts 'End'
      return
    end

    @leafs = parsedJson['tree']
    for leaf in @leafs
      puts "type : #{leaf['type']}"
      # puts "path : #{leaf['path']}"

      if leaf['type'] == 'tree'
        move_next_leaf(leaf['url'])
      end
    end

  end
end
