class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :attendee, references: :users, foreign_key: { to_table: :users }
      t.references :attended_event, references: :events, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
