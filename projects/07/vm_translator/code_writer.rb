class CodeWriter

  def initialize(file_name)
    @file_name = set_file_name(file_name)
    @asm_file = File.open(@file_name, "w")
    @asm_file.close()
  end

  def set_file_name(file_name)
    @file_name = file_name + ".asm"
  end

  def write_arithmetic
  end

  def create_asm_file
    open(@asm_file, "a") do |f|
      f << 'I am appended string'
    end
  end
end
