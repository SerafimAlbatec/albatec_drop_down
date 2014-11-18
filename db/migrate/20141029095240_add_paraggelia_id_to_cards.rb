class AddParaggeliaIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :paraggelia_id, :integer
  end
end
