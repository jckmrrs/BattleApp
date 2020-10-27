require 'sinatra'

class Battle < Sinatra::Base
  get '/battle' do
    p 'Testing infrastructure working!'
  end

  get '/player-one-name' do
    #write code to show form to enter player one name & submit button
  end
  run! if app_file == $0
end
