require_relative "parser"
require_relative "code_writer"

module VmTranslator

  def self.create_asm_file
    file_name = ARGV[0]
    file = file_name.split(".")[0]
    code_writer = CodeWriter.new(file)
    file_contents = ARGF.read
    parser = Parser.new(file_contents)
    while parser.has_more_commands?
      parser.advance
      case parser.command_type
      when Parser::C_ARITHMETIC
        puts "arithmetic"
      when Parser::C_PUSH
        code_writer.write_push_pop(parser.command_type,
                                   parser.arg1,
                                   parser.arg2)
      end
    end
  end
end

VmTranslator.create_asm_file
