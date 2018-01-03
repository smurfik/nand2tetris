class CodeWriter

  def initialize(file_name)
    @file_name = set_file_name(file_name)
    @asm_file = File.open(@file_name, "w")
    @asm_file.close()
  end

  def set_file_name(file_name)
    @file_name = file_name + ".asm"
  end

  def write_arithmetic(command)
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
      end
    end
  end
end
