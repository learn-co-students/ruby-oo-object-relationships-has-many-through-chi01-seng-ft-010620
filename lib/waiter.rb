class Waiter
    attr_reader :name, :experience 

    @@all = []
    
    def initialize(name, experience)
        @name = name
        @experience = experience 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals 
        Meal.all.select {|meals| meals.waiter == self}
    end 

    def best_tipper
        meals.max_by {|my_meals| my_meals.tip}.customer
    end 

end