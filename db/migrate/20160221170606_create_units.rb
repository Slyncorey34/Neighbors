class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
    t.string :unitname
    t.string :address
    t.references :user, index: true, foreign_key: true	
    t.timestamps null: false
    end
  end
end
