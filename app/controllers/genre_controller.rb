class GenresController < ApplicationController
  get "/genres" do
    @genres = Genre.all
    erb :"genres/index"
  end

  get "/genres/:slug" do
    # binding.pry
    @genre = Genre.find_by_slug(params["slug"])
    @genre_artists = @genre.artists
    @genre_songs = @genre.songs
    erb :"genres/show"
  end
end
