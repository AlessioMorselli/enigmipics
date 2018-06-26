class AddPictureToVotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :votes, :picture, foreign_key: true
  end
end
