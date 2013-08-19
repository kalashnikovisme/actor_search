class CreateScannings < ActiveRecord::Migration
  def change
    create_table :scannings do |t|
      t.string :type
      t.integer :searcher_id

      t.timestamps
    end
  end
end
