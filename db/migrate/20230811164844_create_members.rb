class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :state
      t.string :district
      t.string :party
      t.string :address
      t.string :image_url
      t.string :email

      t.timestamps
    end
  end
end
