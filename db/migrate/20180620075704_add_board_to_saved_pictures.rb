class AddBoardToSavedPictures < ActiveRecord::Migration[5.1]
  def change
    add_reference :saved_pictures, :board, foreign_key: true
  end
end
