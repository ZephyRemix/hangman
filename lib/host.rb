class Host
  def initialize; end
  
  def get_secret_word(bag_of_words)
    secret_word = bag_of_words.filter! {|word| word.length >= 5 && word.length <= 12}.sample
    secret_word
  end
end