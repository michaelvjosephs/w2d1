class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize (name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    @employees = []

    super
  end

  def bonus(multiplier)
    employee_salary_total * multiplier
  end

  def employee_salary_total
    sum = 0
    return sum if employees.empty?

    employees.each do |employee|
      sum += employee.salary
      sum += employee.employee_salary_total if employee.is_a?(Manager)
    end

    sum
  end

end

ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
