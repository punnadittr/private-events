class CreateEventListings < ActiveRecord::Migration[5.2]
  def change
    create_table :event_listings do |t|

      t.timestamps
    end
  end
end
