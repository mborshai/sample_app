class Course < ActiveRecord::Base
	has_many :course_offerings
	has_many :faculty, through: :course_offerings

	validates :course_name, presence: true, length: {maximum: 50}
	validates :course_number, presence: true, length: {maximum: 6 }
	validates :course_description, presence: true, length: {maximum: 500}
	validates :credit_hours, presence: true, numericality: { only_integer: true}
end

