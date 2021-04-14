class AddSupplementsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :supplement, foreign_key: true
  end
end
