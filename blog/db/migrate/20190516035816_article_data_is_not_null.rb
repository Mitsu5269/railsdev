class ArticleDataIsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :articles, :name, false
    change_column_null :articles, :description, false
  end
end
