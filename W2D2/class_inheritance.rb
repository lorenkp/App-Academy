class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss = nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    self.employees.inject(0) { |total_sal, employee|
                                total_sal + employee.salary } * multiplier
  end

  def add_employees(employee)
    employee.each { |person| @employees << person }
    p @employees[0].name
  end

end

ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)


ned.add_employees([darren, shawna, david])
darren.add_employees([shawna, david])


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
