class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Song.all.find {|g| g.slug == slug}
  end
end
