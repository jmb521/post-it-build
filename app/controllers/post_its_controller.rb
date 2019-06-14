class PostItsController < ApplicationController

  # GET: /post_its
  get "/post_its" do
    erb :"/post_its/index.html"
  end

  # GET: /post_its/new
  get "/post_its/new" do
    erb :"/post_its/new.html"
  end

  # POST: /post_its
  post "/post_its" do
    redirect "/post_its"
  end

  # GET: /post_its/5
  get "/post_its/:id" do
    erb :"/post_its/show.html"
  end

  # GET: /post_its/5/edit
  get "/post_its/:id/edit" do
    erb :"/post_its/edit.html"
  end

  # PATCH: /post_its/5
  patch "/post_its/:id" do
    redirect "/post_its/:id"
  end

  # DELETE: /post_its/5/delete
  delete "/post_its/:id/delete" do
    redirect "/post_its"
  end
end
