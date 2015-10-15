require_relative 'setup'
require_relative 'contact'
require_relative 'phone'
require 'pry'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class Application

  def new_contact
    puts "Enter their first name:"
    firstname = STDIN.gets.chomp
    puts "Enter their last name:"
    lastname = STDIN.gets.chomp
    puts "Enter an email:"
    email = STDIN.gets.chomp
    puts "Enter phone number:"
    number = STDIN.gets.chomp
    puts "What type of number?"
    type  = STDIN.gets.chomp
    @new_contact = Contact.add(firstname, lastname, email)
  end

  def display_error
    @new_contact.errors.messages.each_pair { |k, v| puts "The #{k} #{v[0]}."}
  end

  def update
    puts "Select contact to update by ID"
    id = STDIN.gets.chomp.to_i
    found_con = Contact.find(id)
    puts "What would you like to update?"
    answer = STDIN.gets.chomp
    case answer
      when 'first name'
        found_con[:first_name]  = STDIN.gets.chomp
      when 'last name'
        found_con[:last_name]  = STDIN.gets.chomp
      when 'email'
        found_con[:email]  = STDIN.gets.chomp
      # when 'number'
      #   found_con.phones[:number] = STDIN.gets.chomp
      end
    found_con.save
  end

  def find_by
    puts "How would you like to find by (first name, last name, email)?"
    answer = STDIN.gets.chomp
    case answer
      when 'first name'
        puts Contact.find_all_by_firstname(STDIN.gets.chomp)
      when 'last name'
        puts Contact.find_all_by_lastname(STDIN.gets.chomp)
      when 'email'
        puts Contact.find_by_email(STDIN.gets.chomp)
      end
  end

  def delete
    puts "Select contact to update by ID"
    id = STDIN.gets.chomp.to_i
    Contact.destroy(id)
    puts "Contact deleted."
  end

  def interprets_input
    case ARGV[0]
    when 'help'
      puts "Here is a list of available commands:\n\tnew  - Create a new contact\n\tupdate  - Update a new contact\n\tdelete  - Delete a contact\n\tlist - List all contacts\n\tshow - Show a contact\n\tfind - Find a contact"
    when 'list'
      puts Contact.list
    when 'new'
      new_contact
      display_error
    when 'show'
      puts Contact.search(ARGV[1].to_i)
    when 'find'
      find_by
    when 'update'
      update
    when 'delete'
      delete
    end
  end
end

Application.new.interprets_input