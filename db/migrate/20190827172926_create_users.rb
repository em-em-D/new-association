# frozen_string_literal: true

# :nodoc:
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :user_token

      t.timestamps
    end
  end
end
