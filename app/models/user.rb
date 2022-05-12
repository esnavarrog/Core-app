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



  def self.from_omniauth(access_token)

    user = User.where(email: access_token.info.email).first
    unless user
      user = User.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user.name = access_token.info.name
    user.nickname = "#{access_token.info.name}#{access_token.provider}#{access_token.uid}"
    user.image = access_token.info.image
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.confirmed_at = Time.zone.now
    user.save
    user
  end

end
