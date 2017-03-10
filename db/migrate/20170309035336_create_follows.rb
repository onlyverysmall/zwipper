class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, index: true, references: :users, null: false
      t.references :followee, index: true, references: :users, null: false

      t.timestamps null: false
    end

    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followee_id
    add_index :follows, [:follower_id, :followee_id], unique: true
  end
end
