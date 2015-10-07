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
    @name = STDIN.gets.chomp
    puts "Enter an email:"
    @email = STDIN.gets.chomp
  end

  def add_phone
    @phone = ""
    puts q = "Enter phone number and type"
    @phone << STDIN.gets.chomp
    puts "Do you want to add another?"
    phone_answer = STDIN.gets.chomp
    if phone_answer == 'yes'
      @phone << ","
      add_phone
    end
  end

  def verify_duplicate
    Contact.all.each do |contact|
      if contact[1] == @email
      return puts "This contact already exists. Please use another email."
    end
  end
    save_contact_arr
  end

  def save_contact_arr
    Contact.create(@name, @email, @phone)
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
      puts "#{contact['Name']} (#{contact[1]}) (#{contact[2]})" if (index + 1) == id.to_i
    end
  end

  def interprets_input
    case ARGV[0]
    when 'help'
      puts "Here is a list of available commands:\n\tnew  - Create a new contact\n\tlist - List all contacts\n\tshow - Show a contact\n\tfind - Find a contact"
    when 'list'
      list_contacts
    when 'new'
      new_contact
      add_phone
      verify_duplicate
    when 'show'
      show_contact(ARGV[1].to_i)
    when 'find'
      Contact.find(ARGV[1])
    end
  end
end

Application.new.interprets_input