class AddPostIdToParagraphs < ActiveRecord::Migration[7.0]
  def change
    add_column :paragraphs, :post_id, :integer
  end
end
