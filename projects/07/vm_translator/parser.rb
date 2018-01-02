class Parser
  attr_reader :lines
  C_PUSH = Object.new
  C_ARITHMETIC = Object.new

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
    else
      C_ARITHMETIC
    end
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
