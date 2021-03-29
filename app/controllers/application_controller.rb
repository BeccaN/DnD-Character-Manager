require './config/environment'
require './app/models/user'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  get "/" do
    if logged_in? 
      redirect to "/users/#{current_user.id}"
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def authorized_to_edit?(record)
      record.user == current_user
    end

    def redirect_to_login? 
      if !logged_in?
        flash[:error] = "You must be logged in to view that page..."
        redirect :"/"
      end
    end

  end

end
