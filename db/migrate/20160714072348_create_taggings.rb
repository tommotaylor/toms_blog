class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings, id: :uuid do |t|
      t.uuid :tag_id
      t.uuid :taggable_id
      t.string :taggable_type

      t.timestamps
    end

    add_index :taggings, [:taggable_type, :taggable_id]
  end
end
