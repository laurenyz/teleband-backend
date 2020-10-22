class CreateStudentAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_assignments do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.string :student_audio
      t.text :student_response
      t.string :student_notation_url
      t.integer :tone, default: 1
      t.integer :rhythm, default: 1
      t.integer :expression, default: 1
      t.boolean :graded, default: false

      t.timestamps
    end
  end
end
