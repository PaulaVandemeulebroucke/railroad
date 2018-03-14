class AddCoordinatesToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
  end
end
