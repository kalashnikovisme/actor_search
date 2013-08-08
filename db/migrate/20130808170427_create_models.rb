class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
