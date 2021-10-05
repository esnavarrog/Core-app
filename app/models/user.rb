class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :nickname
  validates_uniqueness_of :nickname
  enum role: [:admin_super, :girl, :user]
  enum status: [:active, :locked, :inactive]
end
