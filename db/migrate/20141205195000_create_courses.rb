class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.string :course_name
      t.string :course_description
      t.integer :credit_hours

      t.timestamps
    end
  end
end
