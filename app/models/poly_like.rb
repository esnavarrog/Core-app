class PolyLike < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  enum emoji: [:heart_arrow, :devil_smile, :enamorado, :angry, :wink, :kiss]
end
