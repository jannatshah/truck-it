class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
      t.string :requirement

      t.timestamps
    end
  end
end
