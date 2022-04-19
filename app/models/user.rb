class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable,
         :omniauthable, omniauth_providers:[:facebook, :google_oauth2]
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :girls
  has_many :poly_likes
  has_many :inscriptions
  validates_presence_of :nickname
  validates_uniqueness_of :nickname
  enum role: [:user, :admin_super, :girl]
  enum status: [:active, :locked, :inactive]



  def self.create_from_provider_data(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

end
