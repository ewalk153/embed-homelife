class CreateObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :observations do |t|
      t.integer :client_id
      t.text :data

      t.timestamps
    end
  end
end
