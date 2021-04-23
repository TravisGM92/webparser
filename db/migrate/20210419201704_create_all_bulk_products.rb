class CreateAllBulkProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :all_bulk_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
