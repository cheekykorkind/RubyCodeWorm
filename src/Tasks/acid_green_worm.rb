require 'json'
require_relative 'requester_worm'
require_relative '../Constants/js_navigation_status'


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
    status = JsNavigationStatus::BEFORE_ITEM
    prev_line = ''

    for line in @tree.lines
      if status == JsNavigationStatus::BEFORE_ITEM && line.include?('<tr class="js-navigation-item">')
        status = JsNavigationStatus::MEET_ITEM
        prev_line = line.dump
        next
      end

      if status == JsNavigationStatus::MEET_ITEM && line.include?('<a class="js-navigation-open"')
        status = JsNavigationStatus::MEET_OPEN
        prev_line = line.dump
        next
      end

      if status == JsNavigationStatus::MEET_OPEN && line.include?('</a>')
        status = JsNavigationStatus::AFTER_OPEN
        prev_line = line.dump
        next
      end

      # puts line.dump
      if status == JsNavigationStatus::MEET_OPEN
        puts self.get_html_attribute_value('title', prev_line)

        prev_line = line.dump
        break


        # puts line.dump
      end

    end
  end

  def get_html_attribute_value(attribute_name, string)
    string.scan( /#{attribute_name}=\\"([^\\"]*)\\"/).last.first
  end

end

# string1 = '<tr class="js-navigation-item" title="wah">'
# puts string1.scan( /title="([^"]*)"/).last.first

# if line.include? '<tr class="js-navigation-item">'
#   status = JsNavigationStatus::MEET_ITEM

#   if line.include? '<a class="js-navigation-open"'
#     status = JsNavigationStatus::MEET_OPEN

#     if line.include? '</a>'
#       puts status
#       status = JsNavigationStatus::AFTER_OPEN
#     end
#   end
# end



# puts @tree.dump
# puts @tree.lines.count
# puts @tree.class
# puts @tree.encoding
# puts @tree.include? "\n"
# puts @tree.lines.class
