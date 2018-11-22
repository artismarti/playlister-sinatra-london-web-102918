require 'pry'
class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/:slug" do
    # binding.pry
    @song = Song.find_by_slug(params["slug"])
    @song_artist = Artist.find(@song.artist_id)
    @song_genres = @song.genres
    erb :"songs/show"
  end
end
