class AddAccounttIdToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :account, null: false, foreign_key: true
  end
end
