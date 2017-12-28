require_relative "hack_assembler/parser"

module HackAssembler

  def self.create_hack_file
    file_name = ARGV[0]
    parser = HackAssembler::Parser.new(file_name)
    parser.parse_labels
    parser.create_hack_file
  end

  def self.see_contents
    file_name = ARGV[0]
    parser = HackAssembler::Parser.new(file_name)
    parser.remove_comments!
    parser.see_contents_of_file
  end

  def self.see_labels_contents
    file_name = ARGV[0]
    parser = HackAssembler::Parser.new(file_name)
    parser.parse_labels
    parser.see_contents_of_file
  end
end

puts HackAssembler.create_hack_file
# puts HackAssembler.see_contents
# puts HackAssembler.see_labels_contents
