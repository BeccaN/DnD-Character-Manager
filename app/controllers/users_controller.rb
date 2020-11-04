class UsersController < ApplicationController

  get "/login" do
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/users/:id'
    else
      redirect to '/failure'
    end
  end

  get "/signup" do
    erb :'users/signup'
  end 

  post "/signup" do
    
    if params[:name] == "" || params[:name].length < 8
      redirect to "/failure"
    #if params[:name] is valid
    #if params[:password] is valid  params[:password] == ""
    #if params[:email] is valid  params[:email] == ""
    else
      User.create(:name => params[:name], :password => params[:password], :email => params[:email])
      redirect to "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end


  # # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

  # GET: /users/5
  get "/users/:id" do
    if logged_in?
      @user = current_user
      erb :'users/show'
    else
      redirect '/login' 
    end
  end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
