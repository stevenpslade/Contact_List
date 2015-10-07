## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

    attr_accessor :contacts

    def self.read_contacts
      CSV.read("contact.csv", headers:true)
    end

    def self.get_contact_id(input)
      CSV.foreach("contact.csv", headers:true) do |row|
        # Subtracting line number by 1 because it is counting headers as a line
        puts @id = "Contact's ID: #{($. - 1)}" if (row[0] || row[1]).include? input
        end
    end

    def self.contacts(arr=[])
      @contacts = arr
    end

    def self.write_csv
      CSV.open("contact.csv", "a") do |file|
          file << @contacts
      end
    end
end