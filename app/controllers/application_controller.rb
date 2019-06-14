require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set session_secret: 'my_secret'
  end

  get "/" do
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end

  post '/login' do
    if params[:username] != "" && params[:password] != ""
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/post-its'
      else
        @username = params[:username]
        erb :login
      end
    end
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != "" && params[:email] != ""
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect '/post-its'
      else
        redirect '/signup'
      end
    end
  end

  helpers do

    def current_user
      User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
  end
end
