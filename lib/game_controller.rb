class GameController
  def initialize; end
  
  def get_guess
    puts "Pick an alphabet: "
    guess = gets.chomp
  end

  def prompt_save_game(display, game_state)
    loop do
      puts "Do you wish to save the game? (Type Y or N)"
      prompt = gets.chomp
      if prompt == "Y"
        save_game(display, game_state)
        break
      elsif prompt == "N"
        break
      end
      puts "You did not key in the right input, please try again."
    end
  end

  def load_game?
    puts "Do you wish to load the game from where you left off? (type Y or N)"
    prompt = gets.chomp
    if prompt == "Y"
      true
    elsif prompt == "N"
      false
    end
  end

  def load_game
    obj_array = []
    original_separator = $/ # Save the original separator
    $/ = "\n\n" # Set the record separator to double newline

    File.open('save_game/save.txt', 'r').each do |object|
      obj_array << Marshal.load(object)
    end

    $/ = original_separator # Reset the record separator to its original value
    obj_array
  end
  
  private

  def save_game(display, game_state)
    folder = 'save_game'
    Dir.mkdir(folder) unless Dir.exist?(folder)
    serialized_objects = [Marshal::dump(display), Marshal::dump(game_state)]
    write_to_file(serialized_objects, folder)
  end

  def write_to_file(serialized_objects, dir)
    save_file = "#{dir}/save.txt"
    # gs_file = "#{dir}/game_state.txt"
    File.open(save_file, 'w') do |file|
      (0..1).each do |index|
        file.puts serialized_objects[index]
        file.puts ""
      end
      file.close
    end
  end
end