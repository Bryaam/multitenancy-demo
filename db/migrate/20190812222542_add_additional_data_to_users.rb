class AddAdditionalDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :domain, :string
  end
end
