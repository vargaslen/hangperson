require 'sinatra/base'
require 'sinatra/flash'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  before do
    @game = session[:game] || HangpersonGame.new('')
  end

  after do
    session[:game] = @game
  end

  # These two routes are good examples of Sinatra syntax
  # to help you with the rest of the assignment
  get '/' do
    redirect '/new'
  end

  get '/new' do
    erb :new
  end

  post '/create' do
    # NOTE: don't change next line - it's needed by autograder!
    word = params[:word] || HangpersonGame.get_random_word
    # NOTE: don't change previous line - it's needed by autograder!

    @game = HangpersonGame.new(word)
    redirect '/show'
  end

  # Use existing methods in HangpersonGame to process a guess.
  # If a guess is repeated, set flash[:message] to "You have already used that letter."
  # If a guess is invalid, set flash[:message] to "Invalid guess."
  post '/guess' do
    if params.key?(:guess)
      letter = params[:guess].to_s[0]
    else
      redirect '/show'
    end 
    #@game.guess(letter)
    #largo = @game.check_win_or_lose
    begin

    #p "params.to_s:#{params.to_s}"
    ### YOUR CODE HERE ###
    #la sentencia before ha capturado la instancia de juego en @game
    flash[:message] = "Ya probaste con esa letra" if (@game.guesses.include?(letter) || @game.wrong_guesses.include?(letter))
    #p "flash:#{flash[:message]}"
    @game.guess(letter)
    if @game.check_win_or_lose == :win
      redirect '/win'
    end
    if @game.check_win_or_lose == :lose
        redirect '/lose'
    end
    redirect '/show'


    rescue ArgumentError
      flash[:message] = "Argumento invalido"
      #p "flash:#{flash[:message]}"
      redirect '/show'
    end



  end

  # Everytime a guess is made, we should eventually end up at this route.
  # Use existing methods in HangpersonGame to check if player has
  # won, lost, or neither, and take the appropriate action.
  # Notice that the show.erb template expects to use the instance variables
  # wrong_guesses and word_with_guesses from @game.
  get '/show' do
    ### YOUR CODE HERE ###

    erb :show # You may change/remove this line


  end
  get '/tramposo' do
    ### YOUR CODE HERE ###

    erb :tramposo # You may change/remove this line


  end

  get '/win' do
    ### YOUR CODE HERE ###

    p "@game.juego_valido=#{@game.juego_valido.to_s}"
    if @game.juego_valido.eql?("comenzado")
      @game.juego_valido = ''
      erb :win
    else
      redirect '/tramposo'
    end

  end

  get '/lose' do
    ### YOUR CODE HERE ###
    @game.juego_valido = ''
    erb :lose # You may change/remove this line
  end

end
