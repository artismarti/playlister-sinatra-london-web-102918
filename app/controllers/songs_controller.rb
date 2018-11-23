require 'pry'
class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    @song_artist = Artist.find(@song.artist_id)
    @song_genres = @song.genres
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params["slug"])
    @genres = Genre.all
    @artists = Artist.all
    @song_artist = Artist.find(@song.artist_id)
    @song_genres = @song.genres
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    
    redirect to "songs/:slug"
  end

end
