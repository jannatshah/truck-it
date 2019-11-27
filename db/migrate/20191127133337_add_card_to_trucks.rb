class AddCardToTrucks < ActiveRecord::Migration[5.2]
  def change
    add_column :trucks, :card, :boolean, default: false
  end
end
