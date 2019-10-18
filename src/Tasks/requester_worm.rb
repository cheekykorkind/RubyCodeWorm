require "base64"
require 'net/http'
require "json"

class RequesterWorm
  def get_json(url)
    return Net::HTTP.get_response(URI(url)).body
  end
end
