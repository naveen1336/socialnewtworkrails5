class CreatePosts < ActiveRecord::Migration[5.0]
  def up
    create_table :posts do |t|

    t.string :title 
    t.string :content
     t.references :user, index: true, foreign_key: true
      t.references :likeable, polymorphic: true, index: true
      t.timestamps
    end
  end
def down
drop_table :posts
end

end
