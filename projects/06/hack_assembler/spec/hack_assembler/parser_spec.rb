require 'hack_assembler/parser'

RSpec.describe HackAssembler::Parser do
  describe "#remove_comments!" do
    it "returns a file without comments and whitespaces" do
      initial_file = File.open("initial.txt", "w")
      initial_file.write "// This file is part of www.nand2tetris.org\r\n"\
      "// and the book \"The Elements of Computing Systems\"\r\n"\
      "// by Nisan and Schocken, MIT Press.\r\n"\
      "// File name: projects/06/add/Add.asm\r\n"\
      "\r\n"\
      "// Computes R0 = 2 + 3  (R0 refers to RAM[0])\r\n"\
      "\r\n"\
      "@2\r\n"\
      "D=A\r\n"
      initial_file.close

      parser = HackAssembler::Parser.new("initial.txt")
      without_comments = "@2\r\n"\
                         "D=A\r\n"
      expect(File.read parser.remove_comments!).to eq without_comments
    end
  end

  it "returns a instruction in binary" do
    initial_file = File.open("initial.txt", "w")
    initial_file.write "// This file is part of www.nand2tetris.org\r\n"\
    "// and the book \"The Elements of Computing Systems\"\r\n"\
    "// by Nisan and Schocken, MIT Press.\r\n"\
    "// File name: projects/06/add/Add.asm\r\n"\
    "\r\n"\
    "// Computes R0 = 2 + 3  (R0 refers to RAM[0])\r\n"\
    "\r\n"\
    "@2\r\n"\
    "D=A\r\n"
    initial_file.close

    parser = HackAssembler::Parser.new("initial.txt")
    parser.remove_comments!
    expect(parser.a_instruction_in_binary("@1\r\n")).to eq "0000000000000001\r\n"
  end

end
