class School
  attr_reader :students

  def initialize
    @students = []
  end

  def students(grade)
    @students.select{ |student| student[:grade] == grade }
      .map{|student| student[:name]}.sort
  end

  def add(name, grade)
    @students << { name: name, grade: grade }
  end

  def students_by_grade
    @students
      .group_by{ |key| key[:grade] }.sort
      .map do |grade, students|
        {
          grade: grade,
          students: students.map { |s| s[:name] }.sort
        }
       end
    end
end

module BookKeeping
  VERSION = 3
end
