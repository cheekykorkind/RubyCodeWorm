require "base64"
require 'net/http'
require "json"

class RequesterWorm
    def get_json(url)   
        return Net::HTTP.get_response(URI(url)).body
    end
end


# puts get_json 'https://api.github.com/repos/cheekykorkind/JHCompiler/branches/master'
