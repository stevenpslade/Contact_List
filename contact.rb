class Contact
 
  attr_accessor :name, :email, :contacts, :contact_arr

  def initialize(name, email)
    @name = name
    @email = email
  end
 
  # def to_s
  #   # TODO: return string representation of Contact
  #   "Name: #{@contacts.name} Email: #{@contacts.email}"
  # end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      @contacts = Contact.new(name, email)
    end

    def add_contact
      @contact_arr << "\n" + @contacts.name
      @contact_arr << @contacts.email
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end

    def initialize_contact_arr
      @contact_arr = []
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@contact_arr
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end