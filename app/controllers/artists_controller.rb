class ArtistsController < ApplicationController
  get "/artists" do
    @artists = Artist.all
    erb :"artists/index"
  end

  get "/artists/:slug" do
    # binding.pry
   @artist_songs = []
    @artist = Artist.find_by_slug(params["slug"])
    @artist_songs << Song.find_by(artist_id: @artist.id)
    erb :"artists/show"
  end
end
