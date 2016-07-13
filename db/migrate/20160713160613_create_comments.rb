class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body
      t.string :commentable_type
      t.uuid :commentable_id

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
