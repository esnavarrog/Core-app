class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :poly_likes, as: :likeable
  validates :message, presence: {message: "No puedes enviar un comentario en blanco"}
end
