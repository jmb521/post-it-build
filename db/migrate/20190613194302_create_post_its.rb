class CreatePostIts < ActiveRecord::Migration
  def change
    create_table :post_its do |t|
      t.integer :user_id
      t.string :content
      
      t.timestamps null: false
    end
  end
end
