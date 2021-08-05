class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(flight_number)
    @flight_numbers.any? { |flight| flight.upcase == flight_number.upcase }
  end

  def add_flight(flight_number)
    @flight_numbers << flight_number.upcase if !has_flight?(flight_number)
  end
end