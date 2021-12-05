class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :message, presence: {message: "No puedes enviar un comentario en blanco"}
end
