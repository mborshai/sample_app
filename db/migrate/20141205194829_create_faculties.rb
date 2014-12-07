class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|

      t.string :first_name
      t.string :last_name
      t.string :department
      t.string :rank

      t.timestamps
    end
  end
end
