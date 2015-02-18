class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :mt4_id
      t.decimal :capital_sold

      t.timestamps null: false
    end
  end
end
