class Bit < ApplicationRecord
  belongs_to :post
  belongs_to :user

  enum status: [:pending, :pay, :rejected]
end
