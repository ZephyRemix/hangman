class GameState 
  attr_accessor :has_won, :has_lost, :turn_count
  def initialize 
    self.has_won = false
    self.has_lost = false
    self.turn_count = 0
  end

  def game_over(output) 
    if output.include? "_" && turn_count == 20
      self.has_lost = true
    elsif !output.include? "_"
      self.has_won = true
    end
  end

  def update
    self.turn_count += 1
  end

end