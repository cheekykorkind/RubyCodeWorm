module  TraversalWorm
  def traverse_navigation_items(navigation_items)
    return if navigation_items.empty?

    navigation_items.each do |item|
      if item['type'] == 'directory'
        puts "================================================"
        puts "directory : #{item['title']}"

        temp_worm = AcidGreenWorm.new("#{@base_url}#{item['href']}")
        temp_worm.start
        self.traverse_navigation_items(temp_worm.get_navigation_items)
      else
        puts "-- #{item['title']}"
      end
    end
  end

end
