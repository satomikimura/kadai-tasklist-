class AddStatusToTalk < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :status, :string
  end
end
