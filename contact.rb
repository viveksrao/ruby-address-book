require "./phone_number"
require "./address"

class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers, :addresses

  def initialize
    @phone_numbers = []
    @addresses = []
  end

  def add_phone_number(kind,number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

  def add_address(kind,street_1,street_2,city,state,postal_code)
    address = Address.new
    address.kind = kind
    address.street_1 = street_1
    address.street_2 = street_2
    address.city = city
    address.state = state
    address.postal_code = postal_code
    addresses.push(address)
  end

  def first_name
    @first_name
  end

  def middle_name
    @middle_name
  end

  def last_name
    @last_name
  end

  def full_name
    full_name = first_name
    if !@middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += ' '
    full_name += last_name
    full_name
  end

  def last_first
    last_first = last_name
    last_first += ", "
    last_first += first_name
    if !@middle_name.nil?
      last_first += " "
      last_first += middle_name.slice(0,1) # Takes the first letter of middle name
      last_first += "."
    end
    last_first
  end

  def first_last
    first_name + " " + last_name
  end

  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when  'last'
      last_name
    else
      first_last
    end
  end

  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each{|phone_number| puts phone_number}
  end

  def print_addresses
    puts "Addresses"
    addresses.each{|address| puts address.to_s('short')}
  end
end

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"
jason.add_phone_number("Home","123-456-7890")
jason.add_phone_number("Work","789-123-4560")
jason.add_phone_number("Cell","456-789-1230")
jason.add_address("Home","4709 California Street","","San Francisco","CA","94118")
jason.add_address("Work","655 Montgomery St","8th Floor","San Francisco","CA","94111")

john = Contact.new
john.first_name = "John"
john.middle_name = "Christopher"
john.last_name = "Lobo"
john.add_phone_number("Home","111-222-3333")
john.add_phone_number("Work","222-333-1111")
john.add_phone_number("Cell","333-111-2222")
john.add_address("Home","310 Arballo Drive","Apt MH","San Francisco","CA","94132")
john.add_address("Work","345 Marine Drive","29th Floor","San Jose","CA","94555")


tom = Contact.new
tom.first_name = "Tom"
tom.middle_name = "Brandon"
tom.last_name = "Crawford"
tom.add_phone_number("Home","444-555-6666")
tom.add_phone_number("Work","555-666-4444")
tom.add_phone_number("Cell","666-444-5555")
tom.add_address("Home","123 Fremont Street","Apt 101","San Bruno","CA","94102")
tom.add_address("Work","1505 Milpitas Street","7th Floor","Milpitas","CA","94333")


puts "\n"
puts jason.to_s('full_name')
jason.print_phone_numbers
jason.print_addresses
puts "\n"
# puts jason.to_s('last_first')
# puts jason.to_s('first_last')
# puts jason.to_s('first')
# puts jason.to_s('last')
# puts jason.to_s('')

puts john.to_s('full_name')
john.print_phone_numbers
john.print_addresses
puts "\n"
# puts john.to_s('last_first')
# puts john.to_s('first_last')
# puts john.to_s('first')
# puts john.to_s('last')
# puts john.to_s('')

puts tom.to_s('full_name')
tom.print_phone_numbers
tom.print_addresses
puts "\n"
# puts tom.to_s('last_first')
# puts tom.to_s('first_last')
# puts tom.to_s('first')
# puts tom.to_s('last')
# puts tom.to_s('')
