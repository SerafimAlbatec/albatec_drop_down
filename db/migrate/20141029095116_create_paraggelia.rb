class CreateParaggelia < ActiveRecord::Migration
  def change
    create_table :paraggelia do |t|
      t.float :sunolo

      t.timestamps
    end
  end
end
