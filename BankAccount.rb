class Account
  attr_reader :name, :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    'Access denied: incorrect PIN.'
  end

  public

  def display_balance(_pin_number)
    if pin_number == pin
      puts "Balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def withdraw(_pin_number, amount)
    if pin_number == pin && amount < balance
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{balance}"
    elsif pin_number == pin && amount > balance
      puts 'Insuffent funds.'
    else
      puts pin_error
    end
  end
end

checking_account = Account.new('Kevin', 23_000_000)
