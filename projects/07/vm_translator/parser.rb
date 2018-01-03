class Parser
  attr_reader :lines
  C_ARITHMETIC = Object.new
  C_PUSH = Object.new
  C_POP = Object.new
  C_LABEL = Object.new
  C_GOTO = Object.new
  C_IF = Object.new
  C_FUNCTION = Object.new
  C_RETURN = Object.new
  C_CALL = Object.new

  def initialize(contents)
    @lines = split_lines(contents)
  end

  def has_more_commands?
    lines.any?
  end

  def advance
    @current_command = lines.shift
  end

  def command_type
    case @current_command.split(' ').first
    when 'push'
      C_PUSH
    when 'pop'
      C_POP
    when 'label'
      C_LABEL
    when 'goto'
      C_GOTO
    when 'if-goto'
      C_IF
    when 'function'
      C_FUNCTION
    when 'call'
      C_CALL
    when 'return'
      C_RETURN
    else
      C_ARITHMETIC
    end
  end

  def arg1
    case command_type
    when C_ARITHMETIC
      @current_command
    else
      @current_command.split[1]
    end
  end

  def arg2
    @current_command.split[2].to_i
  end

  def split_lines(contents)
    contents
      .split("\r\n")
      .map do |line|
      if line.start_with?("//")
        line = ""
      else
        line = line
      end
    end.reject(&:empty?)
  end
end
