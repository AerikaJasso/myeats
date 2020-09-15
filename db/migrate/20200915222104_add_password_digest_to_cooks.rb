class AddPasswordDigestToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :password_digest, :string
  end
end
