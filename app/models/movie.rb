class Movie < ActiveRecord::Base
	belongs_to :user
	has_many :reviews
	searchkick
	has_attached_file :image, styles: { medium: "400x600#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	scope :new_releases, -> { where(year: Time.now.year)}
  	scope :romance_movies, -> { where(genre: "Romance")}
  	scope :action_movies, -> { where(genre: "Action")}
  	scope :animated_movies, -> { where(genre: "Animated")}
end
