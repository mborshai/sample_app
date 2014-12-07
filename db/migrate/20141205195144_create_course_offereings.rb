class CreateCourseOffereings < ActiveRecord::Migration
  def change
    create_table :course_offereings do |t|
      t.integer :faculty_id
      t.integer :course_id
      t.string :semester
      t.integer :year
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
