# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_manager'
require_relative 'database_connection_setup'
require 'uri'
require 'sinatra/flash'


class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions, :method_override
  register Sinatra::Flash

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
    flash[:notice] = "You must submit a valid URL." unless BookmarkManager.create(url: params[:url], title: params[:title])
    
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
    flash[:notice] = "You must submit a valid URL." unless  BookmarkManager.update(id: params[:id], title: params[:title], url: params[:url])
    
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'bookmarks/comments'
  end

  post '/bookmarks/:id/comments' do
    BookmarkManager.add_comment(comment: params[:comment], id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
