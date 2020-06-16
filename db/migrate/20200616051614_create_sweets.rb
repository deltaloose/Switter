class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :name #お菓子名前
      t.text :opinion #説明
      #t.integer :price #価格
      t.string :sweet_image_id #お菓子画像
      t.timestamps
    end
  end
end
