class AddAccountIdToWidgets < ActiveRecord::Migration[5.1]
  def change
    add_reference :widgets, :account, foreign_key: true
  end
end
