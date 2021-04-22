# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_manager'

class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions, :method_override

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmark_manager_list = BookmarkManager.list_all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    BookmarkManager.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    BookmarkManager.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do 
    @bookmark = BookmarkManager.find(id: params[:id])
    erb :"bookmarks/update"
  end 

  patch '/bookmarks/:id' do
    BookmarkManager.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
