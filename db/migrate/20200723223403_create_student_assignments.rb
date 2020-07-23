class CreateStudentAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_assignments do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.string :student_audio
      t.integer :tone
      t.integer :rhythm
      t.integer :expression

      t.timestamps
    end
  end
end
