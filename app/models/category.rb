class Category < ApplicationRecord
  validates_presence_of :keyword
  belongs_to :supplement
end
