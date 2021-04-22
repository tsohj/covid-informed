class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.string :up
      t.string :down
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
