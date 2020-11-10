class CharactersController < ApplicationController

  get "/characters/new" do
    erb :"/characters/new"
  end

  post "/characters" do
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    
    @character = Character.create(params)
    @character.user_id = current_user.id
    @character.save
    
    redirect "/characters/#{@character.id}"
  end

  get "/characters/:id" do
    @character = Character.find(params[:id])
    erb :"/characters/show"
  end

  get "/characters/:id/edit" do
    @character = Character.find(params[:id])
    erb :"/characters/edit"
  end

  patch "/characters/:id" do
    @character = Character.find(params[:id])
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    @character.update(name: params[:name], race: params[:race], class_lvl: params[:class_lvl], alignment: params[:alignment], personality: params[:personality], photo: params[:photo])

    redirect "/characters/#{@character.id}"
  end

  delete "/characters/:id" do
    @character = Character.find(params[:id])
    @character.destroy
    redirect "/users/#{current_user.id}"
  end
  
end
