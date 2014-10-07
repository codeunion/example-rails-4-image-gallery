class AddPicturesTable < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture, { null: false }
      t.string :caption, { null: false, default: "" }
      t.text :description, { null: false, default: "" }
      t.timestamps
    end
  end
end
