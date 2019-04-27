class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.date :release_date
      t.string :discription

      t.timestamps
    end
  end
end
