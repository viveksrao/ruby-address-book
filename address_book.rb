require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def display_menu
    loop do
      puts "Address Book"
      puts "e: Exit"
      print "Enter your choice: "
      input = gets.chomp.downcase
      case input
      when 'e'
        break
      end
    end
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})",results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-","")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-","").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})",results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})",results)
  end

  def print_results(search,results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

end


address_book = AddressBook.new
address_book.display_menu

# jason = Contact.new
# jason.first_name = "Jason"
# jason.last_name = "Seifer"
# jason.add_phone_number("Home","123-456-7890")
# jason.add_phone_number("Work","789-123-4560")
# jason.add_phone_number("Cell","456-789-1230")
# jason.add_address("Home","4709 California Street","","San Francisco","CA","94118")
# jason.add_address("Work","655 Montgomery St","8th Floor","San Francisco","CA","94111")
#
# address_book.contacts.push(jason)

# john = Contact.new
# john.first_name = "John"
# john.middle_name = "Christopher"
# john.last_name = "Lobo"
# john.add_phone_number("Home","111-222-3333")
# john.add_phone_number("Work","222-333-1111")
# john.add_phone_number("Cell","333-111-2222")
# john.add_address("Home","310 Arballo Drive","Apt MH","San Francisco","CA","94132")
# john.add_address("Work","345 Marine Drive","29th Floor","San Jose","CA","94555")
#
# address_book.contacts.push(john)

# tom = Contact.new
# tom.first_name = "Tom"
# tom.middle_name = "Brandon"
# tom.last_name = "Crawford"
# tom.add_phone_number("Home","444-555-6666")
# tom.add_phone_number("Work","555-666-4444")
# tom.add_phone_number("Cell","666-444-5555")
# tom.add_address("Home","123 Fremont Street","Apt 101","San Bruno","CA","94102")
# tom.add_address("Work","1505 Milpitas Street","7th Floor","Milpitas","CA","94333")
#
# address_book.contacts.push(tom)

# address_book.print_contact_list
# address_book.find_by_name("Lobo")
# address_book.find_by_phone_number("123-456-7890")
# address_book.find_by_address("MH")
