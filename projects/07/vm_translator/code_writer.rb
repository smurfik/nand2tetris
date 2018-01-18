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
      write_pop(segment, i)
    end
  end

  private

  def write_pop(segment, i)
    open(@asm_file, "a") do |f|
      f << "// " + 'pop ' + segment + ' ' + i.to_s + "\r\n"

      f << "@#{symbol_for_segment(segment, i)}\r\n"
      if ["temp", "pointer", "static"].include?(segment)
        f << "D=A\r\n"
      else
        f << "D=M\r\n"
        if !i.zero?
          f << "@#{i}\r\n"
          f << "D=A+D\r\n"
        end
      end
      f << "@R13\r\n"
      f << "M=D\r\n"

      f << "@SP\r\n"
      f << "AM=M-1\r\n"
      f << "D=M\r\n"
      f << "@R13\r\n"
      f << "A=M\r\n"
      f << "M=D\r\n"
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
    else
      open(@asm_file, "a") do |f|
        f << "// " + 'push ' + segment + ' ' + i.to_s + "\r\n"

        f << "@#{symbol_for_segment(segment, i)}\r\n"
        if ["temp", "pointer", "static"].include?(segment)
          f << "D=A\r\n"
        else
          f << "D=M\r\n"
          if !i.zero?
            f << "@#{i}\r\n"
            f << "D=A+D\r\n"
          end
        end
        f << "@R13\r\n"
        f << "M=D\r\n"

        f << "@R13\r\n"
        f << "A=M\r\n"
        f << "D=M\r\n"
        f << "@SP\r\n"
        f << "A=M\r\n"
        f << "M=D\r\n"
        f << "@SP\r\n"
        f << "M=M+1\r\n"
      end
    end
  end

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

  def symbol_for_segment(segment, offset)
    case segment
    when 'temp'
      5 + offset
    when 'pointer'
      3 + offset
    when 'static'
      "#{@file_name}.#{offset}"
    else
      base_address(segment)
    end
  end

  def base_address(segment)
    {
      'local' => 'LCL',
      'argument' => 'ARG',
      'this' => 'THIS',
      'that' => 'THAT'
    }.fetch(segment)
  end

  def generate_label(text="LABEL")
    @counter += 1
    "#{text}.#{@counter}"
  end
end
