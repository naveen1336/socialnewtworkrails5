class CreateComments < ActiveRecord::Migration[5.0]
  def up
    create_table :comments do |t|
t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
def down
drop_table :comments
end


end
