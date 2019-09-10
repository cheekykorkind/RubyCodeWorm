require "base64"
require 'net/http'
require "json"

uri = URI('https://api.github.com/repos/cheekykorkind/JHCompiler/branches/master')
res = Net::HTTP.get_response(uri)

# Status
puts res.code       # => '200'
puts res.message    # => 'OK'
puts res.class.name # => 'HTTPOK'

# Body
parsedJson = JSON.parse(res.body)
treeRoot = parsedJson['commit']['commit']['tree']['url']

puts treeRoot