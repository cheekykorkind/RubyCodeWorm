require_relative '../Constants/php_todo_status'

class PhpTodoWorm
  def initialize(lines)
    @lines = lines
    @todo_line_nums = []
    @status = PhpTodoStatus::START_EXTRACT
  end

  def extract_todo()
    @lines.each_with_index do |line, line_num|
      if line.include?('//') && line.include?('@todo')
        @todo_line_nums << line_num + 1
        next
      end

      if @status == PhpTodoStatus::START_EXTRACT
        if line.include?('/*')
          @status = PhpTodoStatus::MEET_MULTI_LINE_COMENT
          next
        end
      end

      if @status == PhpTodoStatus::MEET_MULTI_LINE_COMENT
        if line.include?('*/')
          @status = PhpTodoStatus::AFTER_MULTI_LINE_COMENT
          next
        end

        if line.include?('@todo')
          @todo_line_nums << line_num + 1
          next
        end
      end

    end
    @status = PhpTodoStatus::END_EXTRACT

  end

  def get_todo_line_nums()
    self.extract_todo()
    @todo_line_nums
  end
end
