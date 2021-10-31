#{ instance is updated with following new() }

class Fruits
    @@sum = 0

    def self.get_sum
      puts "合計の価格は#{@@sum}円です"
    end

    def initialize(name, price)
      @name = name
      @price = price
      @@sum = @@sum + price
    end
end

Fruits.new("リンゴ", 120)
Fruits.new("オレンジ", 200)
Fruits.new("イチゴ", 60)

Fruits.get_sum
