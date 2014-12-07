class Faculty < ActiveRecord::Base
	has_many :course_offerings
	has_many :courses, through: :course_offerings

	validates :last_name, presence: true, length: {maximum: 50}
	validates :first_name, presence: true, length: {maximum: 50}
	validates :department, presence: true, length: {maximum: 50}
	validates :rank, presence: true, inclusion: { in: %w(Assistant\ Professor Association\ Professor Professor) }

	def full_name
		"#{last_name}, #{first_name}"
	end
end
