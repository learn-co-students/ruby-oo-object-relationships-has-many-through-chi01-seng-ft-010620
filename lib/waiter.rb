class Waiter

    attr_reader :name

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
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        highest_tipped_meal = meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip
        end
        highest_tipped_meal.customer
    end

end