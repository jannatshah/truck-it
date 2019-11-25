class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.references :order, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
