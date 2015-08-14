class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Paperclip avatar picture requirement.
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :url =>':s3_domain_url', 
                    :path => '/:class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  # Associations
  has_many :movies 
  has_many :reviews, dependent: :destroy
  def s3_credentials
    {:bucket => "movielaunch", :access_key_id => "AKIAJXZAAVX5X6T3T34A", :secret_access_key => "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"}
  end
end
