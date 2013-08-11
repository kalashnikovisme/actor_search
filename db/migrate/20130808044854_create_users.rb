class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :phone
      t.text :email
      t.timestamps
    end
  end
end
