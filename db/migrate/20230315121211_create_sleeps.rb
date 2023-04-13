class CreateSleeps < ActiveRecord::Migration[6.1]
  def change
    create_table :sleeps do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :asleep_at
      t.datetime :woke_up_at
      t.time :duration

      t.timestamps
    end
  end
end
