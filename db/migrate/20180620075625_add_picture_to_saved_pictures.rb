class AddPictureToSavedPictures < ActiveRecord::Migration[5.1]
  def change
    add_reference :saved_pictures, :picture, foreign_key: true
  end
end
