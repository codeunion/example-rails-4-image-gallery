class AddOwnerToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :owner_id, :integer, { null: false }
  end
end
