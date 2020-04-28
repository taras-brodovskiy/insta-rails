class AddImageDataToInstaposts < ActiveRecord::Migration[6.0]
  def change
    add_column :instaposts, :image_data, :text
  end
end
