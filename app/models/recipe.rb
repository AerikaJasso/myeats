class Recipe < ApplicationRecord
  validates :name,  presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
  belongs_to  :cook
  validates :cook_id, presence: true
end