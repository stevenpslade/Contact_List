# require 'pg'
# require 'pry'
# require 'active_record'

# ActiveRecord::Base.establish_connection(
#   adapter: 'postgresql',
#   database: 'contacts',
#   username: 'development',
#   password: 'development',
#   host: 'localhost',
#   port: 5432,
#   pool: 5,
#   encoding: 'unicode',
#   min_messages: 'error'
# )

class Contact < ActiveRecord::Base
  has_many :phones
  validates_uniqueness_of :email
 
  def to_s
    "ID: #{id}\nName : #{first_name} #{last_name}\nEmail: #{email}"
  end

class << self

  def add(firstname, lastname, email)
    new = Contact.create(first_name: firstname, last_name: lastname, email: email)
    new.phones.create(number: "444-4444", phone_type: "mobile")
  end
 
  def search(id)
    Contact.where(id: id)
  end

  def find_all_by_lastname(name)
      Contact.where(last_name: name)
  end

  def find_all_by_firstname(name)
    Contact.where(first_name: name)
  end

  def find_by_email(email)
    Contact.where(email: email)
  end

  def list
    Contact.all
  end
  
  def show(id)
   Contact.find(id)
  end

end
 
end