class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name
      t.text :description
       t.date :actor_dob

	  t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
