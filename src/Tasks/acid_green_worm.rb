require 'json'
require_relative 'requester_worm'
require_relative '../Constants/js_navigation_status'


class AcidGreenWorm < RequesterWorm
  def initialize(root_url)
    @tree = self.get_json(root_url)
    @navigation_items = Array.new
    @status = JsNavigationStatus::LEVEL_START
  end

  def start()
    self.find_file_wrap()
    # self.show_navigation_items()
  end

  def find_file_wrap()
    @status = JsNavigationStatus::BEFORE_ITEM
    prev_line = ''

    for line in @tree.lines
      if @status == JsNavigationStatus::BEFORE_ITEM && line.include?('<tr class="js-navigation-item">')
        @status = JsNavigationStatus::MEET_ITEM
        prev_line = line.dump
        next
      end

      if @status == JsNavigationStatus::MEET_ITEM && line.include?('<td class="icon">')
        @status = JsNavigationStatus::MEET_ICON
        prev_line = line.dump
        next
      end

      if @status == JsNavigationStatus::MEET_ICON && line.include?('<svg')
        @status = JsNavigationStatus::MEET_SVG
        prev_line = line.dump
        next
      end

      if @status == JsNavigationStatus::MEET_ITEM && line.include?('<a class="js-navigation-open"')
        @status = JsNavigationStatus::MEET_OPEN
        prev_line = line.dump
        next
      end

      if @status == JsNavigationStatus::MEET_OPEN && line.include?('</a>')
        @status = JsNavigationStatus::AFTER_OPEN
        prev_line = line.dump
        next
      end

      if @status == JsNavigationStatus::MEET_SVG
        # puts prev_line
        @navigation_items.push({
          'type' => self.get_html_attribute_value('label', prev_line),
        })

        @status = JsNavigationStatus::MEET_ITEM
        prev_line = line.dump
        next
      end

      if @status == JsNavigationStatus::MEET_OPEN
        @navigation_items.last.merge!({
          'title' => self.get_html_attribute_value('title', prev_line),
          'href' => self.get_html_attribute_value('href', prev_line)
        })

        @status = JsNavigationStatus::BEFORE_ITEM
        prev_line = line.dump
        next
      end

    end
    @status = JsNavigationStatus::LEVEL_END

  end

  def get_html_attribute_value(attribute_name, string)
    string.scan( /#{attribute_name}=\\"([^\\"]*)\\"/).last.first
  end

  def show_navigation_items()
    @navigation_items.each do |item|
      puts item
    end
  end

  def get_status()
    @status
  end

  def get_navigation_items()
    @navigation_items
  end

end
