require_relative "parser"

module VmTranslator

  def self.create_asm_file
    file_name = ARGV[0]
    file_contents = ARGF.read
    parser = Parser.new(file_contents)
    puts parser.lines.inspect
  end
end

VmTranslator.create_asm_file
