class CodeWriter

  def initialize(file_name)
    @file_name = set_file_name(file_name)
    @asm_file = File.open(@file_name, "w")
    @asm_file.close()
    @counter = 0
  end

  def set_file_name(file_name)
    @file_name = file_name + ".asm"
  end

  def write_arithmetic(command)
    case command
    when 'add', 'sub', 'and', 'or'
      open(@asm_file, "a") do |f|
        f << "// " + "#{command}" + "\r\n"
        f << "@SP\r\n"
        f << "MD=M-1\r\n"
        f << "A=M\r\n"
        f << "D=M\r\n"
        f << "A=A-1\r\n"
        f << "M=M#{operand(command)}D\r\n"
      end
    when 'neg', 'not'
      open(@asm_file, "a") do |f|
        f << "// " + "#{command}" + "\r\n"
        f << "@SP\r\n"
        f << "A=M-1\r\n"
        f << "M=#{operand(command)}M\r\n"
      end
    when'eq', 'gt', 'lt'
      true_label, end_label = 2.times.map { generate_label }
      open(@asm_file, "a") do |f|
        f << "// " + "#{command}" + "\r\n"
        f << "@SP\r\n"
        f << "MD=M-1\r\n"
        f << "A=M\r\n"
        f << "D=M\r\n"
        f << "A=A-1\r\n"
        f << "D=M-D\r\n"
        f << "@#{true_label}\r\n"
        f << "D;J#{command.upcase}\r\n"
        f << "@SP\r\n"
        f << "A=M-1\r\n"
        f << "M=0\r\n"
        f << "@#{end_label}\r\n"
        f << "0;JMP\r\n"
        f << "(#{true_label})\r\n"
        f << "@SP\r\n"
        f << "A=M-1\r\n"
        f << "M=-1\r\n"
        f << "(#{end_label})\r\n"
      end
    end
  end

  def write_push_pop(command, segment, i)
    case command
    when Parser::C_PUSH
      write_push(segment, i)
    when Parser::C_POP
      # write pop command into the file
    end
  end

  def create_asm_file
    open(@asm_file, "a") do |f|
      f << 'I am appended string'
    end
  end

  def write_push(segment, i)
    case segment
    when 'constant'
      open(@asm_file, "a") do |f|
        f << "// " + 'push constant ' + i.to_s + "\r\n"
        f << "@#{i}\r\n"
        f << "D=A\r\n"
        f << "@SP\r\n"
        f << "A=M\r\n"
        f << "M=D\r\n"
        f << "@SP\r\n"
        f << "M=M+1\r\n"
      end
    end
  end

  private

  def operand(command)
    {
      'add' => '+',
      'sub' => '-',
      'and' => '&',
      'or' => '|',
      'neg' => '-',
      'not' => '!'
    }.fetch(command)
  end

  def generate_label(text="LABEL")
    @counter += 1
    "#{text}.#{@counter}"
  end
end
