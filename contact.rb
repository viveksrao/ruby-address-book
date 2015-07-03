class Contact
  attr_writer :first_name, :middle_name, :last_name

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
end

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"

john = Contact.new
john.first_name = "John"
john.middle_name = "Christopher"
john.last_name = "Lobo"

tom = Contact.new
tom.first_name = "Tom"
tom.middle_name = "Brandon"
tom.last_name = "Crawford"

puts "\n"
puts jason.to_s('full_name')
puts jason.to_s('last_first')
puts jason.to_s('first_last')
puts jason.to_s('first')
puts jason.to_s('last')
puts jason.to_s('')
puts "\n"

puts john.to_s('full_name')
puts john.to_s('last_first')
puts john.to_s('first_last')
puts john.to_s('first')
puts john.to_s('last')
puts john.to_s('')

puts "\n"
puts tom.to_s('full_name')
puts tom.to_s('last_first')
puts tom.to_s('first_last')
puts tom.to_s('first')
puts tom.to_s('last')
puts tom.to_s('')
