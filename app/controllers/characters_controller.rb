class CharactersController < ApplicationController

  get "/characters/new" do
    if logged_in? 
      erb :"/characters/new"
    else
      flash[:error] = "You must be logged in to create a post!"
      redirect "/"
    end
  end

  post "/characters" do
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    character = Character.new(params)
    character.user_id = current_user.id

    if character.save 
      flash[:message] = "Created a new character successfully!"
      redirect "/characters/#{character.id}"
    else
      flash[:error] = "Character creation failed...Please make sure all fields are complete."
      redirect "/characters/new"
    end
  end

  get "/characters/:id" do
    @character = Character.find(params[:id])
    erb :"characters/show"
  end

  get "/characters/:id/edit" do
    @character = Character.find(params[:id])
    erb :"/characters/edit"
  end

  patch "/characters/:id" do
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    @character = Character.find(params[:id])
    @character.update(params)
    redirect "/users/#{current_user.id}"
  end

  delete "/characters/:id/delete" do
    @character = Character.find(params[:id])
    character = Character.find(params[:id])
    character.destroy
    erb :show
    redirect "/characters"
  end
end
