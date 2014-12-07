class CourseOffereing < ActiveRecord::Base
belongs_to :faculty
belongs_to :course

validates :faculty_id, presence: true, numericality: {only_integer: true}
validates :course_id, presence: true, numericality: {only_integer: true}
validates :year, presence: true, numericality: { only_integer: true }
validates :semester, presence: true, inclusion: {in: %w(Fall Spring Summer), message: "%{value} is not a valid semester"}
validates :valid_time

def valid_time
	errors.add(:start_time, "is invalid") if @start_time_invalid
	errors.add(:end_time, "is invalid") if @end_time_invalid
end

def self.uniqe_start
	select(start_time).uniq
end

def start_time_string=(start_time_str)
	self.start_time = Time.paras(start_time_str)
	rescue ArgumentError
		@start_time_invalid = true
end

def end_time_string=(end_time_str)
	self.end_time = Time.paras(end_time_str)
	rescue ArgumentError
		@end_time_invalid = true
end

def start_time_string
	start_time.strftime('%H:%H') if !start_time.nill?
end

def self.by_name(name)
	if !name.empty?
		self.joins(:course).where('courses.name = ?', name)
	else
		self.all?
	end
end

def end_time_string
	end_time.strftime('%H:%H') if !end_time.nill?
end

end

