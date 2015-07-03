class Address
  attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code

  def to_s(format = 'short')
    address = ''
    case format
    when 'long'
      address += street_1 + ",\n"
      address += street_2 + ",\n" if !street_2.nil?
      address += "#{city}, #{state}, #{postal_code}."

    when 'short'
      address += "#{kind}: "
      address += street_1
      if street_2
        address += " " + street_2
      end
      address += ", #{city}, #{state}, #{postal_code}."
    end
    address
  end
end

jason_home = Address.new
jason_home.kind = "Home"
jason_home.street_1 = "4709 California Street"
jason_home.city = "San Francisco"
jason_home.state = "CA"
jason_home.postal_code = "94118"

john_home = Address.new
john_home.kind = "Home"
john_home.street_1 = "310 Arballo Drive"
john_home.street_2 = "Apt MH"
john_home.city = "San Francisco"
john_home.state = "CA"
john_home.postal_code = "94132"

# puts jason_home.to_s('short')
# puts "\n"
# puts jason_home.to_s('long')
#
# puts "\n"
# puts john_home.to_s('short')
# puts "\n"
# puts john_home.to_s('long')
# puts "\n"
