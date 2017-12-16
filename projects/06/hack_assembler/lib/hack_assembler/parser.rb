require_relative "code"

module HackAssembler
  class Parser
    def initialize(file)
      @file = file
      @original_file_name = file.split(".")[0]
    end

    def remove_comments!
      file_without_comments = File.open("new.asm", "w")
      File.open(@file).each do |line|
        next if (line == "\r\n") || (line[0] == "/")
        file_without_comments << line
      end
      file_without_comments.close
      @file = file_without_comments
    end

    def see_contents_of_file
      File.read @file
    end

    def create_hack_file
      hack_file = File.open("#{@original_file_name}.hack", "w")
      File.open(@file).each do |line|
        if is_a_instruction?(line)
          hack_file << a_instruction_in_binary(line)
        else
          hack_file << c_instruction_in_binary(line)
        end
      end
      hack_file.close
      File.read hack_file
    end

    def is_a_instruction?(instruction)
      instruction[0] == "@"
    end

    def a_instruction_in_binary(instruction)
      in_binary = instruction.chars.select { |char| char.match(/\d/) }.join.to_i.to_s(2)
      number_of_zeros = 16 - in_binary.size
      "0" * number_of_zeros + in_binary + "\r\n"
    end

    def c_instruction_in_binary(instruction)
      instruction = instruction.chop
      "111" + HackAssembler::Code.comp(comp(instruction)) + HackAssembler::Code.dest(dest(instruction)) + HackAssembler::Code.jump(jump(instruction)) + "\r\n"
    end

    def dest(instruction)
      if instruction.include?("=")
        instruction.split("=")[0]
      else
        ""
      end
    end

    def comp(instruction)
      if !instruction.include?("=") && instruction.include?(";")
        instruction.split(";")[0]
      else
        instruction.split("=")[1].split(";")[0]
      end
    end

    def jump(instruction)
      if instruction.include?(";")
        instruction.split(";")[1]
      else
        ""
      end
    end

  end
end
