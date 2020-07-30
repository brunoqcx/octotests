class AddIssueNumberIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :issues, :number, unique: true
  end
end
