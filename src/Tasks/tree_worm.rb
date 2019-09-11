require 'json'
require_relative 'requester_worm'

class TreeWorm < RequesterWorm
    def initialize(branch_url)
        json_response = self.get_json branch_url
        parsedJson = JSON.parse(json_response)
        @root_url = parsedJson['commit']['commit']['tree']['url']
    end

    def start()
        get_tree(self.get_json @root_url) 
    end

    def get_root_url
        @root_url
    end

    def get_tree()
        json_response = self.get_json @root_url
        parsedJson = JSON.parse(json_response)
        parsedJson['tree']
    end

    # def move_next_leaf(json_response)
    #     parsedJson = JSON.parse(json_response)
    #     parsedJson['tree']
    # end


    def is_terminal(json_response)
        parsedJson = JSON.parse(json_response)

        if parsedJson.has_key? 'truncated'
            false
        else
            true
        end
    end
end