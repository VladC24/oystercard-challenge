
class Oystercard
  MAXIMUM_AMOUNT = 90
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :journey

  def initialize(balance= 0, journey = false)
    @balance = balance
    @journey = journey
  end

  def top_up(n)
    raise "top up (#{MAXIMUM_AMOUNT}) limit reached" if @balance + n > MAXIMUM_AMOUNT
    @balance += n
  end

  def deduct(n)
    @balance -= n
  end

  def in_journey?
    @journey
  end

  def touch_in
    raise "insufficient travel funds" if @balance < MINIMUM_AMOUNT
    @journey = true
  end

  def touch_out
    @journey = false
  end

end
