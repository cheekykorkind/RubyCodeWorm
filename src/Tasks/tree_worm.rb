require "json"

class TreeWorm
    def initialize
        @root_url
    end

    def set_root_url(json_response)
        parsedJson = JSON.parse(json_response)
        @root_url = parsedJson['commit']['commit']['tree']['url']
    end

    def get_root_url
        @root_url
    end

    def get_tree(json_response)
        parsedJson = JSON.parse(json_response)
        parsedJson['tree']
    end

    def is_terminal(json_response)
        parsedJson = JSON.parse(json_response)

        if parsedJson.has_key? 'truncated'
            false
        else
            true
        end
    end
end