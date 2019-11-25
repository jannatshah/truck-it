class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :description
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
