require_relative "hack_assembler/parser"

module HackAssembler

  def self.create_hack_file
    file_name = ARGV[0]
    parser = HackAssembler::Parser.new(file_name)
    parser.remove_comments!
    parser.create_hack_file
  end
end

puts HackAssembler.create_hack_file
