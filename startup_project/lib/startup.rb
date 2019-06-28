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

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise ArgumentError.new("error: title is not valid")
        end
    end



end
