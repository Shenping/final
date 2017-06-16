class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :name
      t.string :number
      t.string :scores
      t.text :deal

      t.timestamps
    end
  end
end
