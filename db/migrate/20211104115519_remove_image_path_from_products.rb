class RemoveImagePathFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :image_path
  end
end
