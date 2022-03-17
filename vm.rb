# require_relative '/home/kakizaki/workspace/kakizaki/vm.rb'
# vm = VendingMachine.new
# vm.slot_money (100)
# vm.current_slot_money
# vm.return_money



class Drink
  attr_accessor :list
  def initialize
    @list = {
      Coke: { price: 120, stock: 5},
      Redbull: { price: 200, stock: 5},
      Water: { price: 100, stock: 5}
    }
  end
end

class VendingMachine
  attr_accessor :drink
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @sale_amount = 0 
    @slot_money = 0 
    @drink = Drink.new
  end

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
    return puts money unless MONEY.include?(money)
    @slot_money += money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end

  def sale_amount
    @sale_amount
  end

  def purchase(drink_menu)
    return "お金が足りません" unless @slot_money > drink.list[drink_menu][:price]
    return "在庫がありません" unless drink.list[drink_menu][:stock] > 0
    if @slot_money >= drink.list[drink_menu][:price] && drink.list[drink_menu][:stock] > 0
       puts drink.list[drink_menu][:stock] -= 1
       puts @slot_money -= drink.list[drink_menu][:price]
       puts @sale_amount += drink.list[drink_menu][:price]
    end
  end

  # def purchasable
  #   drink.list.select do |_, val|
  #     val[:price] <= current_slot_money && val[:stock] > 0
  #   end.keys
  # end

  def purchasable_list
    drink.list.map do |key, val|
      key if val[:stock] > 0 && val[:price] <= current_slot_money
    end.compact
  end


  
# #吉住さん案
#   def purchasable 
#     purchasable_list = self.drink.list.values.sort{|a,b| a[:price]<=>b[:price]}
#     if @slot_money >= purchasable_list[2][:price] 
#       return purchasable_list[0..2]
#     elsif @slot_money >= purchasable_list[1][:price]
#       return purchasable_list[0,2]
#     elsif @slot_money >= purchasable_list[0][:price]
#       return purchasable_list[0]
#     end
#   end

#   # 柿崎案 hashのkeyを取り出す方法が？？？
#   def purchasable
#     if @slot_money >= drink.list[:Redbull][:price] && drink.list[:stock] > 0
#       return drink.list.keys
#     elsif @slot_money >= drink.list[:Coke][:price]
#       return drink.list.keys[0,2]
#     elsif @slot_money >= drink.list[:Water][:price]
#       return drink.list.keys[2]
#     end
#   end

  def store(drink_menu)
    puts drink.list[drink_menu][:stock] += 1
  end
end