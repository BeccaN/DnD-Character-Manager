class CharactersController < ApplicationController

  get "/characters/new" do
    erb :"/characters/new"
  end

  post "/characters" do
    
    #fix the params hash with class_lvl and remove the class_name and lvl_num

    #create the character

    #redirect to the new characters/:id page
    redirect "/characters/#{character.id}"
  end

  get "/characters/:id" do
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
