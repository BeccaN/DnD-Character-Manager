class UsersController < ApplicationController

  get "/signup" do
    erb :'users/signup'
  end 

  post "/signup" do
    if params[:name].length < 5 || params[:name].include?(" ")
      redirect to "/failure"
    elsif params[:password].length < 6 || params[:password].include?(" ")
      redirect to "/failure"
    elsif !params[:email].match?(/(@.*com)$/) || params[:email].include?(" ")
      redirect to "/failure"
    else
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      redirect to "/login"
    end
  end

  get "/login" do
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    else
      redirect to "/failure"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/users/:id" do 
    if logged_in?
      @user = current_user
      erb :'users/show'
    else
      redirect "/login"
    end
  end

end
