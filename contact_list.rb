require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class Application
  # Get user input
  def start
    puts "Enter a command:"
    gets.chomp
  end

  def new_contact
    puts "Enter a name:"
    @name = gets.chomp
    puts "Enter an email:"
    @email = gets.chomp
  end

  def save_contact_arr
    Contact.create(@name, @email)
  end

  def list_contacts
    all_records = Contact.all
    all_records.each_with_index do |contact, index|
      puts "id #{index + 1}: #{contact['Name']} (#{contact[1]})"
    end
    puts "#{all_records.size} records total"
  end

  def show_contact(id)
    show_records = Contact.show
    show_records.each_with_index do |contact, index|
      puts "#{contact['Name']} (#{contact[1]})" if (index + 1) == id.to_i
    end
  end

  def interprets_input
    case start
    when 'help'
      puts "Here is a list of available commands:\n\tnew  - Create a new contact\n\tlist - List all contacts\n\tshow - Show a contact\n\tfind - Find a contact"
      interprets_input
    when 'list'
      list_contacts
    when 'new'
      new_contact
      save_contact_arr
    when 'show'
      show_contact(start)
    when 'find'
      Contact.find('Slade')
    end
  end
end

Application.new.interprets_input