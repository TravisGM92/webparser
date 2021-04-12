class Supplement < ApplicationRecord
  serialize :categories, Array
  validates_presence_of :title, :summary, :categories
end
