class CreateDishDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_diets do |t|
      t.references :dish, foreign_key: true
      t.references :diet, foreign_key: true

      t.timestamps
    end
  end
end
