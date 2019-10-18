require_relative 'file_worm'
require_relative 'php_todo_worm'

module TraversalWorm
  def traverse_navigation_items(navigation_items)
    return if navigation_items.empty?

    navigation_items.each do |item|
      full_url = "#{@base_url}#{item['href']}"

      if item['type'] == 'directory'
        puts "================================================"
        puts "directory : #{item['title']}"

        navigation_items = DirectoryWorm.new(full_url).get_navigation_items

        self.traverse_navigation_items(navigation_items)
      else
        puts "-- #{item['title']}, #{item['href']}"

        file = FileWorm.new(full_url).get_file

        todo_line_nums = PhpTodoWorm.new(file).get_todo_line_nums

        @todo_list << {
          'title' => item['title'],
          'url' => full_url,
          'todo_line_numbers' => todo_line_nums,
        }
      end
    end
  end

end
