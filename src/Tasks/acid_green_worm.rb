require 'json'
require_relative 'requester_worm'

class AcidGreenWorm < RequesterWorm
  def initialize(root_url)
    @tree = self.get_json root_url
    @navigation_items = Array.new 
    # @navigation_items.push()
  end

  def start()
    puts 'start'
    self.find_file_wrap()
    puts 'end'
  end

  def find_file_wrap()
    for line in @tree.lines
      if line.include? '<tr class="js-navigation-item">'
        puts line.dump
      end
    end

  end

  
end


# puts @tree.dump
# puts @tree.lines.count
# puts @tree.class
# puts @tree.encoding
# puts @tree.include? "\n"
# puts @tree.lines.class
