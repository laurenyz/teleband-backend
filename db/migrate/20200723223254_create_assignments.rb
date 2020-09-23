class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :assignment_type
      t.text :instructions
      t.string :notation_url

      t.timestamps
    end
  end
end
