# vm = VendingMachine.new
# vm.slot_money (100)
# vm.current_slot_money
# vm.return_money



class Drink
  attr_accessor :list
  def initialize
    @list = {
      Coke: { price: 120, stock: 5},
      Redbull:{ price: 200, stock: 5},
      Water:{price: 100, stock: 5}
    }
  end
end

class VendingMachine
  attr_accessor :drink
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @sale_amount = 0 #売上金額
    @slot_money = 0 # 最初の自動販売機に入っている金額は0円
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
    if @slot_money >= drink.list[drink_menu][:price] && drink.list[drink_menu][:stock] > 0
       puts drink.list[drink_menu][:stock] -= 1
       puts @slot_money -= drink.list[drink_menu][:price]
       puts @sale_amount += drink.list[drink_menu][:price]
    elsif @slot_money < drink.list[drink_menu][:price]
      return "お金が足りません"
    elsif drink.list[drink_menu][:stock] <= 0
      return "在庫がありません"
    end
  end

   #hashのkeyを取り出す方法が？？？
  def purchasable
    if @slot_money >= drink.list[:Redbull][:price]
      return drink.list.keys
    elsif @slot_money >= drink.list[:Coke][:price]
      return drink.list.keys[0,2]
    elsif @slot_money >= drink.list[:Water][:price]
      return drink.list.keys[2]
    end
  end
end