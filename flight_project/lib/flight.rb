class Flight
  attr_reader :passengers

  def initialize(flight_number, capacity)
    @flight_number = flight_number
    @capacity = capacity
    @passengers = []
  end

  def full?
    return true if @passengers.length == @capacity
    false
  end

  def board_passenger(passenger)
    @passengers << passenger if passenger.has_flight?(@flight_number) && !self.full?
  end

  def list_passengers
    @passengers.map { |passenger| passenger.name }
  end

  def [](number)
    @passengers[number]
  end

  def <<(pass_instance)
    board_passenger(pass_instance)
  end

end