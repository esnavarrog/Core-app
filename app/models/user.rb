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
  has_many :bits
  has_many :payments
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
      user.nickname = "#{access_token.info.name}_#{access_token.uid.first(6)}"
    end
    user.name = access_token.info.name
    user.image = access_token.info.image
    user.provider = access_token.provider
    user.uid = access_token.uid
    user.confirmed_at = Time.zone.now
    user.save
    user
  end

  def discount(pay)
    discount = self.bit - pay
    self.bit = discount
    self.save
  end

  def client?
    role == :user.to_s
  end

  def girl?
    role == :girl.to_s
  end

end
