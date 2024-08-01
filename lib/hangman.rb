  require_relative 'host'
  require_relative 'display'
  require_relative 'game_controller'
  require_relative 'game_state'
  require 'pry-byebug'

  # read bag of words into list 
  def load_words
    bag_of_words = []
    f = File.open('google-10000-english-no-swears.txt')

    while line = f.gets do
      bag_of_words << line
    end
    bag_of_words
  end 

  ############################################################################################################################################
  # Code begins
  ############################################################################################################################################
  bag_of_words = load_words

  # get secret word
  host = Host.new
  secret_word = host.get_secret_word(bag_of_words)

  display = Display.new(secret_word)

  display.display_instructions
  display.draw_blank_lines

  game_state = GameState.new
  game_controller = GameController.new

  until game_state.has_won || game_state.has_lost
    # guess = game_controller.save_game(display, game_state)
    guess = game_controller.get_guess
    game_state.update
    display.refresh(guess, game_state.turn_count)
  end

  display.print_result(game_state)