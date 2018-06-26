class CreateSavedPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_pictures do |t|
      t.string :description

      t.timestamps
    end
  end
end
