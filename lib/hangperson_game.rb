class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  #Se definen accessos (setters y getters) a los atributos en la instancia de HangpersonGame
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letra)
    #p "letra:#{letra.instance_of?(String).to_s}"

    raise ArgumentError, 'argumento caracter vacio' if letra.empty?
    raise ArgumentError, 'argumento blanco' if letra.equal?(' ')
    raise ArgumentError, 'argumento no letra' if ! (/[a-z]/i =~ letra)
    letra = ' ' if letra == nil
    return false if ! (/[a-z]/i =~ letra) || self.guesses.include?(letra.downcase) || self.wrong_guesses.include?(letra.downcase)
    if self.word.include?(letra.downcase)
      self.guesses=self.guesses+letra.downcase
    else
      self.wrong_guesses=self.wrong_guesses+letra.downcase
    end
    return  true

  end

  def check_win_or_lose
    #return self.wrong_guesses.length
    if self.wrong_guesses.length >= 7
      #p "self.wrong_guesses.length:#{self.wrong_guesses.length.to_s}"
      return :lose
    else
      self.word.each_char do |c|
        return :play if ! self.guesses.include?(c)
      end
    end
    return :win
  end

  def word_with_guesses
    palabra_con_aciertos = ""

    self.word.each_char do |c|
      if self.guesses.include?(c)
        palabra_con_aciertos+=c
      else
        palabra_con_aciertos+='-'
      end

    end
    return palabra_con_aciertos
  end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
