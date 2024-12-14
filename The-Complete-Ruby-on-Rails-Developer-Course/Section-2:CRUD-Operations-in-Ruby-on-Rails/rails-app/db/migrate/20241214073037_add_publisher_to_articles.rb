class AddPublisherToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :publisher, :string 
  end
end
