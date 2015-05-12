class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :contribution

      t.timestamps null: false
    end
  end
end
