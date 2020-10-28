class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :filename
      t.string :filetype
      t.string :filepath
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
