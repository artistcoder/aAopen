require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        # salaries (hash) containing `title` => `salary` pairs
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def hire(employee_name, title)5
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise ArgumentError.new("error: title is not valid")
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise ArgumentError.new("error: not enough funding")
        end
    end

    def payday
        @employees.each{|employee| pay_employee(employee)}
    end

    def average_salary
        total_sal = 0
        @employees.each do |employee|
            total_sal += @salaries[employee.title]
        end
        total_sal/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @employees += startup.employees
        startup.salaries.each do |title, salary|
            if !@salaries.keys.include?(title)
                @salaries[title] = salary
            end
        end
        startup.close
    end

    def >(startup)
        if self.funding > startup.funding
            true
        else
            false
        end

    end


end
