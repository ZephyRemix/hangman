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

  def refresh(guess, turn)
    update_output(guess.downcase)
    display_outcome(turn)
  end

  def print_result(game_state)
    puts "Won game" if game_state.has_won
    puts "Lost game" if game_state.has_lost
  end

  private
  
  def update_output(guess)
    i = self.secret_word_arr.index(guess)
    if i.nil?
      return bin.push(guess)
    end
    self.output[i] = self.secret_word_arr[i]
    self.secret_word_arr[i] = ""
  end

  def display_outcome(turn)
    print "TURN: #{turn} | "
    print "#{self.output.join("")} | "
    puts "Attempted: #{self.bin.join(",")}"
  end
end