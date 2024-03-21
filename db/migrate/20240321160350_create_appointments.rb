class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :coach_instructor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :appointment_start_date
      t.integer :duration
      t.string :location
      t.string :coach_name

      t.timestamps
    end
  end
end
