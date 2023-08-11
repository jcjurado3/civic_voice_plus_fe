class CreateUserStates < ActiveRecord::Migration[7.0]
  def change
    create_table :user_states do |t|
      t.references :user, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
