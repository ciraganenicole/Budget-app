# frozen_string_literal: true

class AddReferenceToTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :categories, :users, column: :user_id, type: :integer
    add_foreign_key :transancts, :users, column: :user_id, type: :integer
    add_foreign_key :category_transancts, :categories, column: :category_id, type: :integer
    add_foreign_key :category_transancts, :transancts, column: :transancts_id, type: :integer
  end
end
