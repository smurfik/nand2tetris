class Parser
  attr_reader :lines

  def initialize(contents)
    @lines = split_lines(contents)
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
