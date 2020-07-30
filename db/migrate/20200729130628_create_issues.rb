class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :number, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
