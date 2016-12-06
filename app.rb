require 'sinatra'
require_relative 'hangman2.rb'
require 'csv'

CSV.open("records.csv", "a") do |csv|
end

enable :sessions

get'/' do
    session[:play] = nil

    erb :players
end

post '/player_name' do
	session[:player_name] = params[:players]
	erb :game_word, :locals => { :player_name => session[:player_name]}
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
	
	erb :choice, :locals => { :player_name =>session[:player_name], :chances_left => chances_left, :show_board => show_board, :show_guessed_letters => show_guessed_letters}

end

post '/choice' do
	choice = params[:choice].downcase
	
	if session[:play].guessed_letters == true
            redirect '/choice'
        end
	    session[:play].choose_letter(choice)
        
		    if session[:play].winner?
				write_to_csv(session[:player_name],session[:play].word, session[:play].chances)
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

def write_to_csv(name, keyword, chances)
	CSV.open("records.csv") do |csv|
	csv << ["#{name}" + "," + "#{keyword}", "," + "#{chances}"]
end
end	