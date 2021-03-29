class UsersController < ApplicationController

  get "/login" do
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{user.name}!"
      redirect "/users/#{user.id}"
    else
      flash[:error] = "Login credentials were incorrect, please try again..."
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/users/:id" do 
    redirect_to_login?

    @user = User.find(params[:id])
    erb :'users/show'
  end

  get "/signup" do
    erb :'users/signup'
  end 

  post "/signup" do
    user = User.new(params)
    if user.save 
      session[:user_id] = user.id
      flash[:message] = "Account creation successful! Please login with your account info!"
      redirect to "/login"
    else
      flash[:error] = "Account creation failed: #{user.errors.full_messages.to_sentence}."
      redirect "/signup"
    end
  end

end
