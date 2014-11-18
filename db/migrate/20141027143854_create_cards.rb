class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string :artikel
      t.string :text
      t.float :price
      t.string :image
      t.string :amount

      t.timestamps
    end
  end
end
