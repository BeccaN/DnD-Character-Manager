class CharactersController < ApplicationController

  get "/characters/new" do
    erb :"/characters/new"
  end

  post "/characters" do
    #fix the params hash with class_lvl and remove the class_name and lvl_num
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    #create the character
    @character = Character.create(params)
    @character.user_id = current_user.id
    @character.save
    #redirect to the new characters/:id page
    redirect "/characters/#{@character.id}"
  end

  get "/characters/:id" do
    @character = Character.find(params[:id])
    erb :"/characters/show"
  end

  get "/characters/:id/edit" do
    erb :"/characters/edit.html"
  end

  patch "/characters/:id" do
    redirect "/characters/:id"
  end

  delete "/characters/:id/delete" do
    redirect "/characters"
  end
end
