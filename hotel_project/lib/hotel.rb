require_relative "room"
require "byebug"

class Hotel

  def initialize(name, capacities)
    @name = name
    @rooms = {}

    capacities.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity)} 
  end  

  def name
    @name.split.map { |word| word.capitalize }.join(" ")
  end 

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    self.rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
      return puts "sorry, room does not exist"    
    end
    
    if @rooms[room_name].add_occupant(person)
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.any? {|room_name, room| room.available_space > 0}
  end

  def list_rooms
    @rooms.each { |room_name,capacity| puts "#{room_name}: #{capacity.available_space}"}
  end
  
end
