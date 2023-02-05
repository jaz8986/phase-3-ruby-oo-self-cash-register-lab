require 'pry'

class CashRegister

    attr_accessor :total, :items, :last_transaction
    attr_reader :discount

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end


    def add_item(title, price, quantity = 1)
        self.last_transaction= price * quantity
        self.total += self.last_transaction
        quantity.times do 
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - ((self.discount * 0.01)*self.total)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end

c = CashRegister.new(20)

binding.pry
0