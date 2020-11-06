class UsersController < ApplicationController

  get "/signup" do
    erb :'users/signup'
  end 

  post "/signup" do
    if params[:name] == "" || params[:name].length < 5 || params[:name].include?(" ")
      puts "username is no good"
      redirect to "/failure"
    elsif params[:password] == "" || params[:password].length < 6 || params[:password].include?(" ")
      puts "password is no good"
      redirect to "/failure"
    elsif params[:email] == "" || !params[:email].match?(/(@.*com)$/) || params[:email].include?(" ")
      puts 'email is no good!'
      redirect to "/failure"
    else
      User.create(:name => params[:name], :password => params[:password], :email => params[:email])
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
    #if url id is not equal to current user id then auto redirect to current user id page 
    if logged_in?
      @user = current_user
      erb :'users/show'
    else
      redirect "/login"
    end
  end

end
