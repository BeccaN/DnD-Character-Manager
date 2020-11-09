class UsersController < ApplicationController

  get "/signup" do
    erb :'users/signup'
  end 

  post "/signup" do
    if params[:name].length < 5 || params[:name].include?(" ")
      flash[:error] = "Username must be at least 6 characters long and can't include any spaces."
      redirect to "/signup"
    elsif params[:password].length < 5 || params[:password].include?(" ")
      flash[:error] = "Password must be at least 6 characters long and can't include any spaces."
      redirect to "/signup"
    elsif !params[:email].match?(/(@.*com)$/) || params[:email].include?(" ")
      flash[:error] = "Email must be a valid email and can't include any spaces."
      redirect to "/signup"
    else
      User.create(:name => params[:name], :password => params[:password], :email => params[:email])
      flash[:message] = "Successfully created an account, please login!"
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
      flash[:message] = "Welcome back #{user.name}!"
      redirect to "/users/#{user.id}"
    else
      flash[:error] = "The login credentials were incorrect. Please try again!"
      redirect to "/login"
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
