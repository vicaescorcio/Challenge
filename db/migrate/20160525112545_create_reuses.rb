class CreateReuses < ActiveRecord::Migration
  def change
    create_table :reuses do |t|
      t.string :cod1
      t.string :cod2
      t.float :note
      t.string :name1
      t.string :name2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
       add_index :reuses, [:user_id, :created_at]
  end
end
