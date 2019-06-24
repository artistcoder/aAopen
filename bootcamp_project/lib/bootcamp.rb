class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new{|hash, key| hash[key] = []}
end

  def name
    @name
  end
  def slogan
    @slogan
  end
  def teachers
    @teachers
  end
  def students
    @students
  end
  def grades
    @grades
  end


  def hire(str)
    @teachers << str
  end
  
  def enroll(student)
    if @students.length < @student_capacity
        @students << student
        true
    else
        false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    (@students.length / @teachers.length).floor
  end

  def add_grade(student, grade)
    if enrolled?(@student)
        @grades[student] << grade
        true
    else
        false
    end
  end

  def num_grades(str)
  end

  def average_grade(str)
  end


end
