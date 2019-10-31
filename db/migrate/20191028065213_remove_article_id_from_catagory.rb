class RemoveArticleIdFromCatagory < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :article_id
  end
end
