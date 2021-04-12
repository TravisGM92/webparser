class CreateSupplement < ActiveRecord::Migration[5.2]
  def change
    create_table :supplements do |t|
      t.string :title
      t.string :summary
      t.text :categories, :default => [].to_yaml
    end
  end
end
