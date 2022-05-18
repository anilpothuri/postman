# frozen_string_literal: true

class RemoveColumnRoleFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :role, :string
  end
end
