class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :school_id
      t.string :status
      t.string :name

      t.timestamps
    end
  end
end
