class CreateAnalosimas < ActiveRecord::Migration
  def change
    create_table :analosimas do |t|
      t.string :artikel
      t.integer :wgr
      t.string :text
      t.float :pl22
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
