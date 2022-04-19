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

  def self.create_from_provider_data(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && self.provider.blank?
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  def has_no_password?
    self.encrypted_password.blank?
  end
end
