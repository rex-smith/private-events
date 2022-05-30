class CreatorIdAsForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :events, :users, column: :creator_id
  end
end
