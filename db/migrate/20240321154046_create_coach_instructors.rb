class CreateCoachInstructors < ActiveRecord::Migration[7.1]
  def change
    create_table :coach_instructors do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.integer :years_of_experience
      t.string :picture
      t.string :location

      t.timestamps
    end
  end
end
