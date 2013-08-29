class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :state
      t.integer :user_id
      t.integer :searcher_id

      t.timestamps
    end
  end
end
