class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :body, null: false
      t.date :created_at
    end

    add_foreign_key :comments, :posts, column: :post_id
  end
end
