class CreateSearchers < ActiveRecord::Migration
  def change
    create_table :searchers do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
