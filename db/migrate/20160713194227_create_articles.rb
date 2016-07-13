class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title
      t.text :body
    end
  end
end
