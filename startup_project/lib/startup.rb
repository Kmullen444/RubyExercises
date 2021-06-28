require "employee"
require "byebug"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries #hash
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def > (startup_2)
    self.funding > startup_2.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      employees << Employee.new(employee_name,title)
    else
      raise "not a valid title"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee_instance)
    employee = employee_instance

    if self.funding > @salaries[employee.title]
      employee.pay(@salaries[employee.title])
      @funding -= @salaries[employee.title]
    else
      raise "not enough funding"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee)}
  end

  def average_salary
    sum_salary = 0 
    @employees.each do |employee|
      sum_salary += @salaries[employee.title]
    end

    sum_salary / @employees.length * 1.0
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup_2)
    @funding += startup_2.funding
    startup_2.salaries.each do |title, salary|
      if !@salaries.has_key?(title)
        @salaries[title] = salary
      end
    end
    startup_2.employees.each { |employee| @employees << employee}
    startup_2.close
  end

end
