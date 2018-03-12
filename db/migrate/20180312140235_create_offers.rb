class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :address
      t.text :description
      t.string :company_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
