# frozen_string_literal: true

class AddUserToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :user_id, :integer
  end
end
