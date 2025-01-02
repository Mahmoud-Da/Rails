class AddUserIdToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :user_id, :bigint
  end
end
