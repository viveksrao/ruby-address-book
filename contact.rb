require "./phone_number"
class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers

  def initialize
    @phone_numbers = []
  end

  def add_phone_number(kind,number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
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
end

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"
jason.add_phone_number("Home","123-456-7890")
jason.add_phone_number("Work","789-123-4560")
jason.add_phone_number("Cell","456-789-1230")

john = Contact.new
john.first_name = "John"
john.middle_name = "Christopher"
john.last_name = "Lobo"
john.add_phone_number("Home","111-222-3333")
john.add_phone_number("Work","222-333-1111")
john.add_phone_number("Cell","333-111-2222")


tom = Contact.new
tom.first_name = "Tom"
tom.middle_name = "Brandon"
tom.last_name = "Crawford"
tom.add_phone_number("Home","444-555-6666")
tom.add_phone_number("Work","555-666-4444")
tom.add_phone_number("Cell","666-444-5555")


puts "\n"
puts jason.to_s('full_name')
jason.print_phone_numbers
puts "\n"
# puts jason.to_s('last_first')
# puts jason.to_s('first_last')
# puts jason.to_s('first')
# puts jason.to_s('last')
# puts jason.to_s('')

puts john.to_s('full_name')
john.print_phone_numbers
puts "\n"
# puts john.to_s('last_first')
# puts john.to_s('first_last')
# puts john.to_s('first')
# puts john.to_s('last')
# puts john.to_s('')

puts tom.to_s('full_name')
tom.print_phone_numbers
puts "\n"
# puts tom.to_s('last_first')
# puts tom.to_s('first_last')
# puts tom.to_s('first')
# puts tom.to_s('last')
# puts tom.to_s('')
