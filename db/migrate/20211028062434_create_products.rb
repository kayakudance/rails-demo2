class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.boolean :is_recommended, default: false, null: false

      t.timestamps
    end
  end
end
