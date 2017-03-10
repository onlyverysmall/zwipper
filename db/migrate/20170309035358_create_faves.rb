class CreateFaves < ActiveRecord::Migration
  def change
    create_table :faves do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :zwipp, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    add_index :faves, [:user_id, :zwipp_id], unique: true
  end
end
