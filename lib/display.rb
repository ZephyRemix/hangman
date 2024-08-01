class Display
  attr_accessor :secret_word_arr, :output, :bin
  def initialize(word)
    self.secret_word_arr = word.downcase.split("")
    self.output = []
    self.bin = []
  end

  def display_instructions
    puts "Display instructions"
  end

  def draw_blank_lines
    self.secret_word_arr.length.times {self.output.push("_")}
  end
end