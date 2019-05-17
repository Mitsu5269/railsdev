class ArticleNameIsUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :articles, :name, unique: true
  end
end
