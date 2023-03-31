class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.date :date
      t.string :tag
      t.string :headline
      t.text :content
    end
  end
end
