class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :main_message
      t.integer :user_id
    end
  end
end
