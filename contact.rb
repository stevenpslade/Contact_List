require 'pg'
require 'pry'

class Contact

  TABLE_NAME = 'contacts'
  CONN = PG::Connection.new({
      host: 'localhost',
      user: 'development',
      password: 'development',
      dbname: 'contacts'
      })
 
  attr_accessor :firstname, :lastname, :email, :mobile, :other, :id

  def initialize(firstname, lastname, email, mobile, other = nil, id = nil)
    # TODO: assign local variables to instance variables
    @firstname = firstname
    @lastname = lastname
    @email = email
    @mobile = mobile
    @other = other
    @id = id
  end
 
  def to_s
    "Name : #{@firstname} #{@lastname}\nEmail: #{@email}"
  end

  def save
    if self.id
      CONN.exec_params("UPDATE contacts SET first_name=$1, last_name=$2, email=$3, mobile=$4, other=$5 WHERE id=$6",
        [@firstname, @lastname, @email, @mobile, @other, @id])
    else
      results = CONN.exec_params("INSERT INTO contacts (first_name, last_name, email, mobile, other) VALUES ($1, $2, $3, $4, $5) RETURNING id",
        [@firstname, @lastname, @email, @mobile, @other])
      @id = results[0]["id"]
    end
  end

  def destroy
    if self.id
      CONN.exec_params("DELETE FROM contacts WHERE id = $1;", [id])
    end
  end
 
  ## Class Methods
  class << self

    def convert_to_objects(results)
      contacts = []
      results.each do |c|
        contacts << Contact.new(c["first_name"], c["last_name"], c["email"], c["mobile"], c["other"], c["id"])
      end
      contacts.size > 1 ? contacts : contacts[0]
    end
 
    def find(id)
      Contact.convert_to_objects(CONN.exec_params("SELECT * FROM #{TABLE_NAME} WHERE id = $1;", [id]))
    end

    def find_all_by_lastname(name)
      Contact.convert_to_objects(CONN.exec_params("SELECT * FROM #{TABLE_NAME} WHERE last_name = $1;", [name]))
    end

    def find_all_by_firstname(name)
      Contact.convert_to_objects(CONN.exec_params("SELECT * FROM #{TABLE_NAME} WHERE first_name = $1;", [name]))
    end

    def find_by_email(email)
      Contact.convert_to_objects(CONN.exec_params("SELECT * FROM #{TABLE_NAME} WHERE email = $1;", [email]))
    end
 
    def all
      Contact.convert_to_objects(CONN.exec_params("SELECT * FROM #{TABLE_NAME}"))
    end
    
    def show
      # TODO: Show a contact, based on ID
      ContactDatabase.read_contacts
    end
    
  end
 
end

puts Contact.find(3)
