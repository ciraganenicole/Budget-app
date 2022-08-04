# frozen_string_literal: true

class AddUserToTransancts < ActiveRecord::Migration[7.0]
  def change
    add_column :transancts, :user_id, :integer, foreign_key: { to_table: :users }
  end
end
