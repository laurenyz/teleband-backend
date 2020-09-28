class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :category
      t.text :instructions
      t.string :pdf_url
      t.string :playing_sample_url
      t.string :accompaniment_url

      t.timestamps
    end
  end
end
