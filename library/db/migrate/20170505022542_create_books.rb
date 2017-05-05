class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :introduction
      t.integer :actor
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
