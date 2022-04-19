class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable,
         :omniauthable, omniauth_providers:[:facebook, :google_oauth2]
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :girls
  has_many :poly_likes
  has_many :inscriptions
  validates_presence_of :nickname
  validates_uniqueness_of :nickname
  enum role: [:user, :admin_super, :girl ]
  enum status: [:active, :locked, :inactive]

  def self.create_from_provider_data(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
