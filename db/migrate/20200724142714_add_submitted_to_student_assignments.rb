class AddSubmittedToStudentAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :student_assignments, :submitted, :boolean, default: false
  end
end
