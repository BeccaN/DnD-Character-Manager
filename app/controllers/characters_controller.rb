class CharactersController < ApplicationController
  
  get "/characters" do 
    @characters = Character.all
    erb :"/characters/index"
  end

  get "/characters/new" do
    if logged_in?
      erb :"/characters/new"
    else
      flash[:error] = "You must be logged in to create a character!"
      redirect :"/"
    end
  end

  post "/characters" do
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    character = current_user.characters.new(params)
    
    if character.save
      flash[:message] = "Character creation was successful!"
      redirect "/characters/#{character.id}"
    else
      flash.now[:error] = "Character creation failed: #{character.errors.full_messages.to_sentence}."
      erb :"/characters/new"
    end
  end

  get "/characters/:id" do
    set_character
    erb :"/characters/show"
  end

  get "/characters/:id/edit" do
    redirect_to_login?
    set_character
    
    if authorized_to_edit?(@character)
      erb :"/characters/edit"
    else
      flash[:error] = "You are not authorized to edit that character..."
      redirect "/users/#{current_user.id}"
    end
  end

  patch "/characters/:id" do
    set_character
    params[:class_lvl] = params[:class_name] + " " + params[:lvl_num]
    params.delete("class_name")
    params.delete("lvl_num")
    character.update(name: params[:name], race: params[:race], class_lvl: params[:class_lvl], alignment: params[:alignment], personality: params[:personality], photo: params[:photo])
    
    flash[:message] = "Character update was successful!"
    redirect "/characters/#{character.id}"
  end

  delete "/characters/:id" do
    set_character
    character.destroy

    flash[:message] = "Character was deleted."
    redirect "/users/#{current_user.id}"
  end

  private 
  def set_character 
    @character = Character.find(params[:id])
  end
  
end
