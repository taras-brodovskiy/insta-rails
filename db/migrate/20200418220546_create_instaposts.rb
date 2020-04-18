class CreateInstaposts < ActiveRecord::Migration[6.0]
  def change
    create_table :instaposts do |t|
      t.text :caption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
