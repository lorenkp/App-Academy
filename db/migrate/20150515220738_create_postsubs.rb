class CreatePostsubs < ActiveRecord::Migration
  def change
    create_table :postsubs do |t|
      t.integer :post_id
      t.integer :sub_id

      t.timestamps null: false
    end
  end
end
