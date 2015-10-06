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

  def create_contact(name, email)
    Contact.create(name, email)
    Contact.add_contact
  end

  def store_contact
    new_contact = Contact.all
    set_contact(new_contact)
  end

  def interprets_input
    case start
    when 'help'
      puts "Here is a list of available commands:\n\tnew  - Create a new contact\n\tlist - List all contacts\n\tshow - Show a contact\n\tfind - Find a contact"
      interprets_input
    when 'list'
      get_contact
    when 'new'
      puts "Enter a name"
      name = gets.chomp
      puts "Enter an email"
      email = gets.chomp
      create_contact(name, email)
      store_contact
    when 'show'
    when 'find'
    end
  end
end

Contact.initialize_contact_arr
test = Application.new
test.interprets_input