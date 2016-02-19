class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :unit
      t.string :email
      t.string :password_hash
      t.string :password_salt
      
      t.boolean :admin, default: false
      t.timestamps null: false
    end
  end
end
