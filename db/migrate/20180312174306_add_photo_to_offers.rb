class AddPhotoToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :photo, :string
  end
end
