
class Employee
    attr_accessor :salary
    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        amount = 0
        subordinates = []
        subordinates += @employees
        until subordinates.empty?
            subordinate = subordinates.shift
            amount += subordinate.salary
            subordinates += subordinate.employees if subordinate.class == Manager
        end
        amount * multiplier
    end
end

david = Employee.new("david", "TA", 10000, "darren")
shawna = Employee.new("shawna", "TA", 12000, "darren")

darren = Manager.new("darren", "supervisor", 78000,"ned",[david,shawna])
ned = Manager.new("ned", "founder", 100000,nil, [darren])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3)