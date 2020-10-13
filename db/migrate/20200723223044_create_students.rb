class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer :teacher_id
      t.string :school_id
      t.string :name
      t.string :classes
      t.integer :grade
      t.timestamps
    end
  end
end
