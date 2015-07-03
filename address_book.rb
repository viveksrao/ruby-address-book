require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end


address_book = AddressBook.new

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"
jason.add_phone_number("Home","123-456-7890")
jason.add_phone_number("Work","789-123-4560")
jason.add_phone_number("Cell","456-789-1230")
jason.add_address("Home","4709 California Street","","San Francisco","CA","94118")
jason.add_address("Work","655 Montgomery St","8th Floor","San Francisco","CA","94111")

address_book.contacts.push(jason)

john = Contact.new
john.first_name = "John"
john.middle_name = "Christopher"
john.last_name = "Lobo"
john.add_phone_number("Home","111-222-3333")
john.add_phone_number("Work","222-333-1111")
john.add_phone_number("Cell","333-111-2222")
john.add_address("Home","310 Arballo Drive","Apt MH","San Francisco","CA","94132")
john.add_address("Work","345 Marine Drive","29th Floor","San Jose","CA","94555")

address_book.contacts.push(john)

tom = Contact.new
tom.first_name = "Tom"
tom.middle_name = "Brandon"
tom.last_name = "Crawford"
tom.add_phone_number("Home","444-555-6666")
tom.add_phone_number("Work","555-666-4444")
tom.add_phone_number("Cell","666-444-5555")
tom.add_address("Home","123 Fremont Street","Apt 101","San Bruno","CA","94102")
tom.add_address("Work","1505 Milpitas Street","7th Floor","Milpitas","CA","94333")

address_book.contacts.push(tom)

address_book.print_contact_list
