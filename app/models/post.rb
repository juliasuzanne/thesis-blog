class Post < ApplicationRecord
  has_many :photos
  has_many :paragraphs
end
