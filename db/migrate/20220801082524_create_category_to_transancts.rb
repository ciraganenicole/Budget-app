# frozen_string_literal: true

class CreateCategoryToTransancts < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transancts do |t|
      t.belongs_to :category
      t.belongs_to :transancts

      t.timestamps
    end
  end
end
