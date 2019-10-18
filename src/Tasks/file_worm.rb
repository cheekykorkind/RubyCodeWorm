require 'nokogiri'
require 'pry'
require_relative 'requester_worm'

class FileWorm < RequesterWorm
  def initialize(file_url)
    @raw_file = self.get_json(file_url)
    @file = []
  end

  def start()
    self.find_js_file_line()
  end

  def find_js_file_line()
    for line in @raw_file.lines
      if line.include?('class="blob-code blob-code-inner js-file-line"')
        @one_line = ''

        document = Nokogiri::HTML(line)
        td = document.search('td')

        next if td.empty?

        self.traverse_children(td.first.children)

        @file << @one_line

        next
      end
    end
  end

  def traverse_children(children)
    return if children.empty?

    children.each do |child|
      if child.text?
        @one_line += child.text
      else
        self.traverse_children(child.children)
      end
    end
  end

  def get_file()
    @file
  end
end
