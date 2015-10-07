class Contact
 
  attr_accessor :name, :email, :id, :phone

  def initialize(name, email, phone=nil)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @phone = phone
  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email, phone)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new_contact = Contact.new(name, email, phone)
      contacts_arr = [new_contact.name, new_contact.email, new_contact.phone]
      ContactDatabase.contacts(contacts_arr)
      ContactDatabase.write_csv
      ContactDatabase.get_contact_id(contacts_arr[0])
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      find_records = ContactDatabase.read_contacts
      find_records.each_with_index do |contact|
      puts "#{contact['Name']} (#{contact[1]})" if (contact['Name'] || contact[1]) == term
      end
    end
 
    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.read_contacts
    end
    
    def show
      # TODO: Show a contact, based on ID
      ContactDatabase.read_contacts
    end
    
  end
 
end