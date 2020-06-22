class CreateSweetComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sweet_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :sweet_id

      t.timestamps
    end
  end
end
