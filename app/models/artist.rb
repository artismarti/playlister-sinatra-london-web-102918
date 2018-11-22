class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    artist_name = slug.gsub("-", " ").split.map{|n| n.capitalize}.join(" ")
    Artist.find_by(name: artist_name)
  end
end
