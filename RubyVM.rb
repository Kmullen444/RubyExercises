class Computer
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "File created at #{time} with the name #{filename}"
  end

  def Computer.get_users
    @@users
  end
end

my_computer = Computer.new("Kevin", "85072")

my_computer.create("That one place.")