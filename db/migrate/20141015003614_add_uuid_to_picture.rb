class AddUuidToPicture < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'
    remove_column :pictures, :id
    add_column :pictures, :id, :uuid, { default: "uuid_generate_v4()", null: false }
    connection.execute "ALTER TABLE pictures ADD PRIMARY KEY (id);"
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
