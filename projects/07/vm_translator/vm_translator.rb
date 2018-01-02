require_relative "parser"

module VmTranslator

  def self.create_asm_file
    file_name = ARGV[0]
    file_contents = ARGF.read
    parser = Parser.new(file_contents)
    while parser.has_more_commands?
      parser.advance
      case parser.command_type
      when Parser::C_ARITHMETIC
        puts "arithmetic"
      when Parser::C_PUSH
        puts "push"
      end
    end
  end
end

VmTranslator.create_asm_file
