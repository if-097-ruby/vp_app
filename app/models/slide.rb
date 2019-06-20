class Slide < ApplicationRecord
  belongs_to :presentation
  has_one_attached :image
end

