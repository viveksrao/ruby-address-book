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
end

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"

john = Contact.new
john.first_name = "John"
john.middle_name = "Christopher"
john.last_name = "Lobo"

puts jason.full_name
puts john.full_name
