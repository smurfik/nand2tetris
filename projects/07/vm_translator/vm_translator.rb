require_relative "parser"

module VmTranslator

  def self.create_asm_file
    input = ARGF.read
    puts input.inspect
    # parser = Parser.new(file_name)

  end
end

puts VmTranslator.create_asm_file
