class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.text :abovewriting
      t.text :belowwriting

      t.timestamps
    end
  end
end
