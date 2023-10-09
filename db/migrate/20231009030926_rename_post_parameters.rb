class RenamePostParameters < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :header, :post_header
    rename_column :posts, :date, :posted_date
  end
end
