require 'open-uri'

class Movie < ActiveRecord::Base
	attr_accessor :image_url

	before_validation :download_remote_image, :if => :image_url_provided?
	validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => 'is invalid or inacessioble'

	belongs_to :user
	has_many :reviews
	searchkick
	has_attached_file :image, styles: { medium: "400x600#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	scope :new_releases, -> { where(year: Time.now.year)}
  	scope :romance_movies, -> { where(genre: "Romance")}
  	scope :action_movies, -> { where(genre: "Action")}
  	scope :animated_movies, -> { where(genre: "Animated")}

  	private
  	def image_url_provided?
  		!self.image_url.blank?
  	end

	def download_remote_image
	self.image = do_download_remote_image
	self.image_remote_url = image_url
	end

	def do_download_remote_image
	io = open(URI.parse(image_url))
	def io.original_filename; base_uri.path.split('/').last; end
	io.original_filename.blank? ? nil : io
	rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
	end

end
