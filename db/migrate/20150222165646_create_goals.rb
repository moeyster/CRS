class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :client_target

      t.timestamps null: false
    end
  end
end
