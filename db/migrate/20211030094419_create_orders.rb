class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :paymethod
      t.integer :bill
      t.string :order_status, null: false, default: '支払い確認中'
      t.datetime :order_date

      t.timestamps
    end
  end
end
