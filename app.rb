require 'sinatra'
require_relative 'hangman2.rb'

enable :sessions

get'/' do
    session[:play] = nil

    erb :game_word
end

post '/setup' do
    word = params[:secret_word]
    session[:play] = Hangman2.new(word)
    redirect '/choice'
end

get '/choice' do

	chances_left = session[:play].chances
	show_board = session[:play].show_board
	show_guessed_letters = session[:play].show_guessed_letters
	
	erb :choice, :locals => { :chances_left => chances_left, :show_board => show_board, :show_guessed_letters => show_guessed_letters}

end

post '/choice' do
	choice = params[:choice].downcase
	
	if session[:play].guessed_letters == true
            redirect '/choice'
        end
	    session[:play].choose_letter(choice)
        
		    if session[:play].winner?
                redirect '/winner'
		    elsif 
			    session[:play].loser?
			    redirect '/loser'
		    else
			    redirect '/choice'
	            end
    
end

get '/winner' do
	keyword = session[:play].word
	erb :winner, :locals => { :keyword => keyword}
end




get '/loser' do
	keyword = session[:play].word
	erb :loser, :locals => { :keyword => keyword}
end

