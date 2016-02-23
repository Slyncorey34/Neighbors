class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    t.string :title
    t.text	:note
    
    t.references :unit, index: true, foreign_key: true	
    t. references :user, index: true, foreign_key: true

    t.timestamps null: false
    end
  end
end



