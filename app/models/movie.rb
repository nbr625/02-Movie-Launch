class Movie < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	searchkick
	has_attached_file :image, styles: { medium: "400x600#"}, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :url =>':s3_domain_url', 
                    :path => '/:class/:attachment/:id_partition/:style/:filename'
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	scope :new_releases, -> { where(year: Time.now.year)}
  	scope :romance_movies, -> { where(genre: "Romance")}
  	scope :action_movies, -> { where(genre: "Action")}
  	scope :animated_movies, -> { where(genre: "Animated")}
  	def s3_credentials
      	{:bucket => "movielaunch", :access_key_id => "AKIAJXZAAVX5X6T3T34A", :secret_access_key => "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"}
  	end
end
