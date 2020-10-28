class AddNameToUploads < ActiveRecord::Migration[6.0]
  def change
    add_column :uploads, :name, :string

    remove_column :uploads, :filename, :string
    remove_column :uploads, :filepath, :string
  end
end
